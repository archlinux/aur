# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=launcher-curseforge
pkgname="${_pkgname}-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc="Integrates the Curseforge Modpack installation button to any MultiMC based launcher "
arch=("x86_64")
url="https://github.com/ShayBox/${_pkgname}"
license=("MIT")
source=("${url}/releases/download/${pkgver}/Linux-x86_64.zip")
sha512sums=("1d49be96232cb3afeaa5643e90f5e3f773a10c63c5597269489c9c7bb452a8bc013d5253fdb3939a2a773ea76ff05de29dd90bef24a0c64667c335f9a8449888")
optdepends=("multimc" "polymc" "prismlauncher")

prepare() {
    ar x "${_pkgname}_${pkgver}_amd64.deb"
    tar -zxvf data.tar.gz
}

package() {
    install -Dm755 "usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
