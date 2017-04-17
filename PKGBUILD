# Maintainer: Alex Smith <azphreal19@protonmail.com>
_pkgname=onedrived
pkgname=${_pkgname}-dev
pkgver=r164.62ceee1
pkgrel=1
pkgdesc="A Microsoft OneDrive client for Linux, written in Python3"
arch=('any')
url="https://github.com/xybu/onedrived-dev"
license=('MIT')
depends=('python' 'ngrok')
provides=('onedrived')
conflicts=('onedrived')
replaces=('onedrive-d')
source=("git+https://github.com/xybu/${pkgname}.git")
md5sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "${pkgname}"
	python3 ./setup.py test
}

package() {
	cd "${pkgname}"
	python3 ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
