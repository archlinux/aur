# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: the NICOS contributors, MLZ

pkgname=python-nicos-pyctl
_pkgname=nicos-pyctl
pkgver=1.3.0
pkgrel=1
pkgdesc="NICOS pyctl c module"
groups=('nicos')
arch=('x86_64' 'armv7h')
url="https://nicos-controls.org/"
license=('GPL3')
depends=('python')
conflicts=('nicos-pyctl-git')
provides=('nicos-pyctl')
source=("https://github.com/mlz-ictrl/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e7ecf7eb187bc3c04c2f6fe8812838c3450cddc6b91de3174b56b571f67c1987')


build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

#check() {
#  cd "$_pkgname-$pkgver"
#  python setup.py check -mr
#}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir/
}
