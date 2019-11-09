# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: George C. Privon <accounts5 at privon dot com>

_pyname=emcee
pkgname=python-${_pyname}2
pkgver=2.2.1
pkgrel=1
pkgdesc='Kick ass affine-invariant ensemble MCMC sampling'
url="http://dan.iel.fm/emcee"
depends=('python-numpy')
provides=("python-emcee=${pkgver}")
conflicts=("python-emcee")
license=('BSD')
arch=('any')
source=("https://github.com/dfm/emcee/archive/v$pkgver.tar.gz")
md5sums=('5958687736cf6296a9c632e46337ac5e')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
