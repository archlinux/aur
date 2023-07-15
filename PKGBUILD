# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=launcher-curseforge
pkgname="${_pkgname}-bin"
pkgver=2.1.1
pkgrel=1
pkgdesc="Integrates the Curseforge Modpack installation button to any MultiMC based launcher "
arch=("x86_64")
url="https://github.com/ShayBox/${_pkgname}"
license=("MIT")
source=("${url}/releases/download/${pkgver}/Linux-x86_64.zip")
sha512sums=("6ea1fea633ab6c56bb1ae880de5f88baeb4e9d130e0643f79c5c3d6ba9d407bdf327e21f6a0f8065112f983964c8f43bf202dc694c7945b8c9e10c1d0cbfec7a")
optdepends=("multimc" "polymc" "prismlauncher")

prepare() {
    ar x "${_pkgname}_${pkgver}_amd64.deb"
    tar -zxvf data.tar.gz
}

package() {
    install -Dm755 "usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
