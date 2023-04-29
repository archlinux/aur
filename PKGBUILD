# Maintainer: Tian Qiao <abcnsxyz@gmail.com>

pkgname=('pocsuite3')
pkgver=2.0.4
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
sha512sums=('75ddbdadfb87c219874b6d41d154567be8a0a36c3f0f29c9faad9bed69c8f323525d0b2ec03f9dfc8594eda6a31ee7547fef8429eb295f739bc450e3720044a8')

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
