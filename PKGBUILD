# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=ubports-installer
_pkgcode=0.1.11
_pkgstate=beta
pkgver=${_pkgcode}_${_pkgstate}
_pkgver=${_pkgcode}-${_pkgstate}
pkgrel=2
epoch=1
pkgdesc="Install Ubuntu Touch on Your Device"
arch=('x86_64')
url="https://ubports.com/ubuntu-touch/get-ut"
license=('GPL3')
makedepends=()
depends=()
install=ubports-installer.install
source=("https://github.com/ubports/ubports-installer/releases/download/${_pkgver}/ubports-installer_${_pkgver}_amd64.deb")
md5sums=('e05ba3e93c12bfe12590f779dcb26fc0')

prepare() {
	cd "$srcdir"
	# ar -x "ubports-installer_${_pkgver}_amd64.deb"
	mkdir "${pkgname}-${pkgver}"
	tar -Jxf data.tar.xz --directory="${srcdir}/${pkgname}-${pkgver}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	find ./{opt,usr} -type f -exec install -Dm755 {} "${pkgdir}/{}" \;
}
