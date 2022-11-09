# Maintainer: Tian Qiao <abcnsxyz@gmail.com>

pkgname=('pocsuite3')
pkgver=2.0.1
pkgrel=1
pkgdesc='Open-sourced remote vulnerability testing framework'
url='https://github.com/knownsec/pocsuite3'
arch=('any')
license=('GPL2')
depends=('python-requests' 'python-pysocks' 'python-requests-toolbelt' 'python-urllib3'
  'python-chardet' 'python-termcolor' 'python-colorama' 'python-prettytable'
  'python-colorlog' 'python-scapy' 'python-faker' 'python-pycryptodomex' 'python-pyopenssl'
  'python-jq' 'python-yaml' 'python-lxml' 'python-mmh3' 'python-dacite')
makedepends=('python-setuptools')
optdepends=()
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0d01467791eb31a0b22b9e5d5d3302b9c1a00f4ab67883702b02a972ae91cee8d4ffeaa9b11e32037ab3b79b94120b359c33e4f16b067b8e712b72ec4c86b8d9')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --skip-build -O1 --root="${pkgdir}"
  install -Dm 644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
