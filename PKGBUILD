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
sha512sums=('5ca9a0bc9af081623cf868ff259e71c866f3e653c60ba576a9cd687f641469c8f45de2633dceeb7c17e842ab426cacb0b21706cc9e16b1de26f4843a0e42f071')

build() {
  cd requests_gpgauthlib-${pkgver}
  python setup.py build
}

package() {
  cd requests_gpgauthlib-${pkgver}
  NO_THIRD_PARTY=true python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
