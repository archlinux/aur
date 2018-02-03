# Maintainer: Sean Haugh <seanphaugh@gmail.com>
_pkgname=exodus
_owner=Intoli
pkgname=exodus-bundler
pkgver=1.1.5
pkgrel=2
pkgdesc="Painless relocation of Linux binaries"
arch=('any')
url="https://github.com/$_owner/$_pkgname"
license=('BSD')
depends=('python' 'python-setuptools')
provides=("$pkgname=$pkgver-$pkgrel")
conflicts=('exodus')
source=("https://github.com/$_owner/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('fc29f5377753e1ad4abb1a4161c82024')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.md" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
# vim:set ts=2 sw=2 et:
