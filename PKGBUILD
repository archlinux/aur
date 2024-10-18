# Maintainer: Glucy2<glucy-2@outlook.com>
_pkgname=sast-evento
pkgname=${_pkgname}-bin

pkgver=2.0.74
_hotfix=0
_pkgrel=0
pkgrel="$((_pkgrel+_hotfix))"
provides=("${_pkgname}")
conflicts=("${_pkgname}-git" "${_pkgname}")
depends=('qt6-base')

pkgdesc='An event management system developed and used by NJUPT SAST (binary package)'

license=('MIT')

arch=('x86_64')

url="https://github.com/NJUPT-SAST/sast-evento"

source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.${_hotfix}-pacman-linux-x64.pkg.tar.zst")
sha256sums_x86_64=('5a9fe6ad7c1686079a7128ed5244c940675b692df41ee08d78034eae039f4ee8')
noextract=("${_pkgname}_x86_64.pkg.tar.zst")

prepare() {
    mkdir -p "${srcdir}/${_pkgname}-${pkgver}.${_hotfix}-pacman-linux-x64"
    bsdtar -xf "${_pkgname}-${pkgver}.${_hotfix}-pacman-linux-x64.pkg.tar.zst" -C "${srcdir}/${_pkgname}-${pkgver}.${_hotfix}-pacman-linux-x64"
}

package() {
    cp -r "${srcdir}/${_pkgname}-${pkgver}.${_hotfix}-pacman-linux-x64"/* "${pkgdir}"
}
