# Maintainer: otaj
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgname=python-foolbox-git
pkgdesc="Python utilities to download and parse the MNIST dataset"
pkgver=v2.0.0b0.r8.g4ffc9fc
pkgrel=1
arch=(any)
url='https://github.com/bethgelab/foolbox'
license=(MIT)
provides=('python-foolbox')
conflicts=('python-foolbox')
depends=('python-numpy' 'python-scipy' 'python-gitpython' 'python-requests')
makedepends=(
  'python-setuptools' 'git'
)
options=(!emptydirs)
source=("git+https://github.com/bethgelab/foolbox.git")
sha256sums=('SKIP')

pkgver() {
  cd foolbox
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd "${srcdir}/foolbox"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

