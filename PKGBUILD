# Maintainer: Tian Qiao <abcnsxyz@gmail.com>

pkgname=('pocsuite3')
pkgver=2.0.5
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
sha512sums=('524d5a8e61efb6e4491b39bb3007faa985893dbeee3787848bf28f819d55b73287431e9041c4e6547d174ad92676bcc79ff673c99b05153b47c638dce7585e31')

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
