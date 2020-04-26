# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-requests-gpgauthlib
pkgver=0.1.2
pkgrel=1
pkgdesc='A GPGAuth Client in Python'
arch=('any')
url='https://github.com/liip/requests_gpgauthlib'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/liip/requests_gpgauthlib/archive/${pkgver}.tar.gz")
b2sums=('ee17a073377f7b413bb9377b04ba99188794cf67433c60d087f667bd89e479e470f6a1f3e4d564cd90981300a3734f68d14cb66e25e20828ff27c7f17386cbf6')

build() {
  cd requests_gpgauthlib-${pkgver}
  python setup.py build
}

package() {
  cd requests_gpgauthlib-${pkgver}
  NO_THIRD_PARTY=true python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
