# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=launcher-curseforge
pkgname="${_pkgname}-bin"
pkgver=2.1.2
pkgrel=1
pkgdesc="Integrates the Curseforge Modpack installation button to any MultiMC based launcher "
arch=("x86_64")
url="https://github.com/ShayBox/${_pkgname}"
license=("MIT")
source=("${url}/releases/download/${pkgver}/Linux-x86_64.zip")
sha512sums=("41bfe6b46c21470fe82641bccde1d618620bd809188aa711d0a9112852caa0cbf7ba6ee4ccbde582fb1fa942e012746dce062d43efc3753d446103de1caa41d2")
optdepends=("multimc" "polymc" "prismlauncher")

prepare() {
    ar x "${_pkgname}_${pkgver}_amd64.deb"
    tar -zxvf data.tar.gz
}

package() {
    install -Dm755 "usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
