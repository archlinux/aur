# Maintainer: Bumsik Kim <k.bumsik@gmail.com>

pkgname=python-iotedgehubdev
pkgver=0.14.1
pkgrel=1
pkgdesc="Azure IoT EdgeHub Dev Too;"
arch=("i686" "x86_64")
url="https://github.com/Azure/iotedgehubdev"
license=('MIT')
groups=()
depends=('python-click' 'docker' 'python-pyopenssl' 'python-requests' 'python-six' 'python-applicationinsights'
		 'python-yaml' 'python-jsonpath-rw' 'docker-compose')
makedepends=('python-pip')
provides=($pkgname)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(src::git+https://github.com/Azure/iotedgehubdev.git#tag=v$pkgver)
noextract=()
md5sums=('SKIP')

package() {
  cd $srcdir/src
  PIP_CONFIG_FILE=/dev/null /usr/bin/pip install --isolated --root="$pkgdir" --ignore-installed --ignore-requires-python --no-deps .
}

