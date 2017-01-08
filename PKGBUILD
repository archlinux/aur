# Maintainer: Shane "SajeOne" Brown <contact@shane-brown.ca>
pkgname=python-cursed
pkgver=0.2.0
pkgrel=2
pkgdesc="Simplified curses interface with concurrency, for quick and sane curses apps"
arch=('any')
url="https://github.com/johannestaas/cursed"
license=('GPL')
depends=('python' 'python-six' 'python-gevent')
makedepends=('python-setuptools' 'python-sphinx')
provides=('cursed')
conflicts=('python-cursed-git')
source=("https://github.com/johannestaas/cursed/archive/$pkgver.tar.gz")
sha256sums=('a19ec0d0f42c065f9207f206c07dd474f8413ad332efb11d381e8b91d2c6dfb8')
_gitname=cursed

package() {
  cd "$srcdir/$_gitname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  # Manual Pages
  cd "$srcdir/$_gitname-$pkgver/docs"
  make man
  install -Dm644 "$srcdir/$_gitname-$pkgver/docs/_build/man/cursed.1" "${pkgdir}/usr/share/man/man1/cursed.1"
}

# vim:set ts=2 sw=2 et:
