# Maintainer: Tian Qiao <abcnsxyz@gmail.com>

pkgname=('pocsuite3')
pkgver=1.9.0
pkgrel=1
pkgdesc='Open-sourced remote vulnerability testing framework'
url='https://github.com/knownsec/pocsuite3'
arch=('any')
license=('GPL2')
depends=('python-requests' 'python-pysocks' 'python-requests-toolbelt' 'python-urllib3'
  'python-chardet' 'python-termcolor' 'python-colorama' 'python-prettytable'
  'python-colorlog' 'python-scapy' 'python-faker' 'python-pycryptodomex')
makedepends=('python-setuptools')
optdepends=(
  'python-pyopenssl: self-signed certificate support'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('68ef9f14b4716de3f2c1c20b19cec6286f3ca48331b6ba1971fa2d3eda4c004ede93ac14eaad92d11a9f27bebf9db0f428828a602effa6cd051fc660d5cfa4a7')

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
