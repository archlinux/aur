# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=trackerjacker
pkgver=1.8.7
pkgrel=1
pkgdesc="Map and track WiFi networks and devices through raw 802.11 monitoring."
arch=('any')
url="https://github.com/calebmadrigal/trackerjacker"
license=('MIT')
depends=('python' 'python-setuptools' 'python-scapy' 'python-pyaml' 'python-ruamel-yaml')
source=("https://files.pythonhosted.org/packages/d2/81/4dca960aeb78e070c1639ccbacfaa17182762f5c808c2eee0f1906c5fff4/trackerjacker-${pkgver}.tar.gz")
sha256sums=('b6936241001d56abc126f5f0d00b71752b1405b889a71a343e0b57b25f23b858')

package() {
  cd "${pkgname}-$pkgver"
  sed -i s/'ruamel.yaml==0.15.0'/'ruamel.yaml'/g requirements.txt
  sed -i s/'scapy==2.4.0'/'scapy'/g requirements.txt
  sed -i s/'pyaml>=17.12.1'/'pyaml'/g requirements.txt
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
