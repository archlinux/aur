# Maintainer: Tian Qiao <abcnsxyz@gmail.com>

pkgname=('pocsuite3')
pkgver=2.0.2
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
sha512sums=('3209d10554e6d952146d047443d95533d7c4ea8e3a27f61009314d24a1bf7a2fa421c9dffe5631ea1e0866348f6f34fcd4189e2c27c860180e8fdc4c258e1865')

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
