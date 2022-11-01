# Maintainer: Emilio Reggi <nag@mailbox.org>

pkgname=cfv-git
_pkgname=cfv
_source=https://github.com/cfv-project/cfv.git
pkgver=r664.dee5be3
pkgrel=1
pkgdesc='A utility to test and create a wide range of checksum verification files.'
url='https://github.com/cfv-project/cfv'
license=('GPL')
arch=('any')
depends=('python')
optdepends=('python-pillow: only needed if you want to create the dimensions column of .crc files.')
makedepends=('git' 'python-setuptools')
conflicts=('cfv')
source=("${_pkgname}"::"git+${_source}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
