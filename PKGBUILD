# Maintainer: Yangtse Su <yangtsesu@gmail.com>

_gitbase=qr-filetransfer
pkgname="python-qr-filetransfer-git"
pkgver=r161.0ab883f
pkgrel=1
pkgdesc="Transfer files over WiFi between your computer and your smartphone from the terminal."
arch=('any')
url="https://github.com/sdushantha/qr-filetransfer"
license=('MIT')
depends=('python' 'python-netifaces' 'python-qrcode') 
makedepends=('git' 'python-setuptools')
provides=("python-qr-filetransfer")
conflicts=('qr-filetransfer')
source=("git+https://github.com/sdushantha/qr-filetransfer")
sha512sums=('SKIP')


pkgver() {
	cd $_gitbase
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_gitbase
	python setup.py build
}

package() {
	cd $_gitbase
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
