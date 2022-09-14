# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=apipost-bin
_pkgname=${pkgname%-bin}
pkgver=7.0.3
pkgrel=1
pkgdesc="An API debugging and management tool that supports team collaboration and can generate documents directly."
arch=('x86_64')
url="https://www.apipost.cn/"
license=('unknown')
source=("${_pkgname}.desktop"
        "https://www.apipost.cn/dl.php?client=LinuxGz&arch=x64&version=$pkgver#/${_pkgname}-v$pkgver.tar.gz")
md5sums=("bb57646eba1d0778a6d6575e554a4260"
        "SKIP")

package() {
  install -dm755 "${pkgdir}/opt/${_pkgname}"

  cp -rp linux-unpacked/* "${pkgdir}/opt/${_pkgname}"

  install -dm755 "${pkgdir}/usr/bin"

  ln -sf "/opt/${_pkgname}/${_pkgname}7" "${pkgdir}/usr/bin/${_pkgname}7"

  install -dm755  "${pkgdir}/usr/share/icons/"

  ln -sf "/opt/${_pkgname}/resources/app/icon/1024x1024_apt.icns" "${pkgdir}/usr/share/icons/${_pkgname}7.png"

  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}7.desktop"
}
