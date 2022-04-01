# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: the NICOS contributors, MLZ

pkgname=python-nicos-pyctl
_pkgname=nicos-pyctl
pkgver=1.2.0
pkgrel=1
pkgdesc="NICOS pyctl c module"
groups=('nicos')
arch=('x86_64' 'armv7h')
url="https://nicos-controls.org/"
license=('GPL3')
depends=('python')
conflicts=('nicos-pyctl-git')
provides=('nicos-pyctl')
source=("https://github.com/mlz-ictrl/$_{pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('93fc64901538ae1729fa0130e7227302d7645805848d8db37766f58ab57e4c2b')


build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  python setup.py check -mr
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir/
}
