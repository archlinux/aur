# Maintainer: otaj
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgdesc="Serialization of torch data"
pkgname=python-torchfile-git
pkgver=r33.20b3e13
pkgrel=1
arch=(any)
url='https://github.com/bshillingford/python-torchfile'
license=(BSD3)
depends=('python-numpy')
makedepends=(
  'git'
  'python-setuptools'
)
options=(!emptydirs)
source=("git+https://github.com/bshillingford/python-torchfile.git")
sha256sums=('SKIP')

pkgver() {
  cd "python-torchfile"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
provides=('python-torchfile')
conflicts=('python-torchfile')
  cd "${srcdir}/python-torchfile"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
