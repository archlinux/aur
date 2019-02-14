# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=trackerjacker
pkgver=1.9.0
pkgrel=1
pkgdesc="Map and track WiFi networks and devices through raw 802.11 monitoring."
arch=('any')
url="https://github.com/calebmadrigal/trackerjacker"
license=('MIT')
depends=('python' 'python-setuptools' 'python-scapy' 'python-pyaml' 'python-ruamel-yaml')
source=("https://files.pythonhosted.org/packages/95/d7/74790c2071d9dfeb8cc3b3cf401350b880c0533d5eac584ef10c35bfc640/trackerjacker-${pkgver}.tar.gz")
sha256sums=('d11c984c85eb5c9ffec5d5ae74eaaa1bed273b827c9cb28511b3bab22d71f3fd')

package() {
  cd "${pkgname}-$pkgver"
  sed -i s/'ruamel.yaml==0.15.0'/'ruamel.yaml'/g requirements.txt
  sed -i s/'scapy==2.4.0'/'scapy'/g requirements.txt
  sed -i s/'pyaml>=17.12.1'/'pyaml'/g requirements.txt
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
