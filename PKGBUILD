# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=aliyundrive-webdav-bin
_pkgname=${pkgname%-bin}
pkgver=1.2.6
pkgrel=1
pkgdesc="阿里云盘 WebDAV 服务"
arch=("x86_64")
url="https://github.com/messense/aliyundrive-webdav"
license=("MIT")
depends=()
provides=("${_pkgname}")
options=("!strip" "emptydirs")
install="${_pkgname}.install"
source=("${url}/releases/download/v${pkgver}/aliyundrive-webdav_${pkgver}_amd64.deb")
sha256sums=("8f3652cf9cfa1f6909bab3f5450f0da7574c7ae59f7530e2fbe76df83554c652")

prepare() {
    tar -xf ${srcdir}/data.tar.xz -C ${srcdir}/
}

package() {
    cd ${srcdir}/
    install -Dm755 "usr/bin/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "usr/share/doc/${_pkgname}/copyright" -t "${pkgdir}/usr/share/doc/${_pkgname}/"
    install -Dm644 "etc/systemd/system/aliyundrive-webdav.service" -t "${pkgdir}/etc/systemd/system/"
}
