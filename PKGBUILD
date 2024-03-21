# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dpitunnel-bin
_pkgname=${pkgname/-bin}
__pkgname=DPITunnel
pkgver=1.0.0
pkgrel=1
pkgdesc="Free, simple and serverless solution against censorship for Linux PCs and routers"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/txtsd/DPITunnel"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}.service")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-amd64.zip")
source_i686=("${url}/releases/download/${pkgver}/${_pkgname}-x86.zip")
source_armv7h=("${url}/releases/download/${pkgver}/${_pkgname}-armhf.zip")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-arm64.zip")
sha256sums=('8fc14a33357d08051f1b32466556688c74776a3c63d74aaa4754482c7292f28a')
sha256sums_x86_64=('b0ba3302f692aeefc91223cb6f25f9eeb7d21776b90dd0d4f42a9bdf1aa61898')
sha256sums_i686=('565ad80398850b0844de76b5c9187e97d927f3d4525b9b3ef3f8131e5a071f6f')
sha256sums_armv7h=('967ff422ae7562af416b207236173269a09d057bf21fe2322a5aabef2ddb6303')
sha256sums_aarch64=('09d953874a3369ffbecd3001459b6beb2add0e10a61007e425772d55f0ab1fe6')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
