# Maintainer: Henry Hernaiz <hernaizhenry@gmail.com>

pkgname=python-azure-iot-device
_pkgname=azure-iot-device
pkgver=2.14.0
pkgrel=1
pkgdesc="Azure IoT Device SDK for Python"
arch=('any')
url="https://github.com/Azure/azure-iot-sdk-python"
license=('MIT')
depends=('python' 'python-requests' 'python-six' 'python-azure-core' 'python-pysocks' 'python-urllib3' 'python-deprecation' 'python-janus' 'python-typing_extensions' 'python-requests-unixsocket2' 'python-paho-mqtt')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/51/6b/447e9f205ccefc03998931677784d29354e0c6453a7715a662d4109a567b/azure_iot_device-2.14.0.tar.gz")
sha256sums=('b6d48d4932c240025736ace544c4e71bc49a1576ac998ea1de778af82496ffce')

build() {
  cd "${srcdir}/${_pkgname//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
