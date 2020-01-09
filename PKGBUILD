# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=quark-engine
pkgver=20.01
pkgrel=1
pkgdesc='An Obfuscation-Neglect Android Malware Scoring System'
arch=('any')
license=('GPL')
url='https://github.com/quark-engine/quark-engine'
depends=('python>=3.7' 'python-prettytable' 'python-androguard-git' 'python-tqdm' 'python-colorama' 'python-click')
makedepends=('python-setuptools>=3.7')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bf3578d3716b79a9d9098f7dd403b02be42a19322c0c37c936d824e09178ff43')

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
