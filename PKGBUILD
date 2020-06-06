# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=nodemcu-uploader-git
_gitname=nodemcu-uploader
pkgver=v0.4.3.r35.g3e07591
_pkgdate=20200606
pkgrel=1
pkgdesc="Upload files to your esp8266 running nodeMcu"
arch=("x86_64")
url="https://github.com/kmpm/nodemcu-uploader"
license=('MIT')
depends=('python-pyserial')
makedepends=('git')
source=("git://github.com/kmpm/nodemcu-uploader.git")
sha256sums=('SKIP')
pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
	
build() {
  cd $_gitname
	python setup.py build
}
package() {
  cd $_gitname
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
