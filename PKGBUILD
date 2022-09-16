# Maintainer: robertfoster

pkgname=python-pyfakewebcam
pkgver=0.1.0
pkgrel=1
pkgdesc="An API for writing RGB frames to a fake webcam device on Linux"
arch=('any')
url="https://github.com/jremmons/pyfakewebcam"
license=("GPL3")
depends=('python-numpy' 'v4l2loopback-dkms')
makedepends=('python-setuptools')
source=("https://github.com/jremmons/pyfakewebcam/archive/refs/tags/r${pkgver}.tar.gz")
sha256sums=('b53d816691d1896070d50e0e92a846f4afda61933766dc70a44b36829715e59c')

build() {
  cd "${srcdir}/${pkgname#python-}-r${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname#python-}-r${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
