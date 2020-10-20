# Maintainer : Frikilinux <frikilinux@gmail.com>

pkgname=whipper-plugin-eaclogger
pkgver=0.5.0
pkgrel=1
pkgdesc="A plugin for whipper which provides EAC style log reports."
arch=(any)
url="https://github.com/whipper-team/whipper-plugin-eaclogger"
license=('ISC')
depends=('python' 'whipper')
makedepends=(python-setuptools-scm)
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('230942868012950bb689b2670666328b2cbcc5f9c5d5ca8dd72a2aad9acec721')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
