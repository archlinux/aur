# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=apipost-bin
_pkgname=${pkgname%-bin}
pkgver=6.1.2
pkgrel=1
pkgdesc="An API debugging and management tool that supports team collaboration and can generate documents directly."
arch=('x86_64')
url="https://www.apipost.cn/"
license=('unknown')
source=("${_pkgname}.desktop"
        "https://www.apipost.cn/dl.php?client=LinuxGz&arch=x64&version=$pkgver#/${_pkgname}.tar.gz")
md5sums=("74c20618584d247486311abf144089ea"
        "0376b1f6f824bbb945618eec146d410a")

package() {
  install -dm755 "${pkgdir}/opt/${_pkgname}"

  cp -rp linux-unpacked/* "${pkgdir}/opt/${_pkgname}"

  install -dm755 "${pkgdir}/usr/bin"

  ln -sf "/opt/${_pkgname}/${_pkgname}6" "${pkgdir}/usr/bin/${_pkgname}6"

  install -dm755  "${pkgdir}/usr/share/icons/"

  ln -sf "/opt/${_pkgname}/resources/app/icon/1024x1024_apt.icns" "${pkgdir}/usr/share/icons/${_pkgname}6.png"

  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}6.desktop"
}
