# Maintainer: Glucy2<glucy-2@outlook.com>
_pkgname=sast-evento
pkgname=${_pkgname}-bin

pkgver="2.0.60"
_hotfix=0
_pkgrel=0
pkgrel="$((_pkgrel+_hotfix))"
provides=("${_pkgname}")
conflicts=("${_pkgname}-git" "${_pkgname}")

pkgdesc='An event management system developed and used by NJUPT SAST (binary package)'

license=('MIT')

arch=('x86_64')

url="https://github.com/NJUPT-SAST/sast-evento"

source_x86_64=("${pkgname}_x86_64.pkg.tar.zst::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.${_hotfix}-pacman-linux-x64.pkg.tar.zst")
sha256sums_x86_64=('84180ef3baed86bafd7627a9e67c662f22d5037276917ed31ecd8d8030443122')
noextract=("${_pkgname}_x86_64.pkg.tar.zst")

prepare() {
    mkdir -p "${srcdir}/${pkgname}_x86_64"
    bsdtar -xf "${pkgname}_x86_64.pkg.tar.zst" -C "${srcdir}/${pkgname}_x86_64"
}

package() {
    cp -r "${srcdir}/${pkgname}_x86_64"/* "${pkgdir}"
}
