# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
_pkgver=2.0.0
pkgver=2.0.0
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')

source_x86_64=("${prjname}-${_pkgver}-x86_64.deb::${url}/releases/download/${_pkgver}/${prjname}_${_pkgver}_amd64.deb")
source_i686=("${prjname}-${_pkgver}-i686.deb::${url}/releases/download/${_pkgver}/${prjname}_${_pkgver}_i386.deb")
source_aarch64=("${prjname}-${_pkgver}-aarch64.deb::${url}/releases/download/${_pkgver}/${prjname}_${_pkgver}_arm64.deb")
source_armv7h=("${prjname}-${_pkgver}-armv7h.deb::${url}/releases/download/${_pkgver}/${prjname}_${_pkgver}_armhf.deb")

sha512sums_x86_64=('756d19fbe1a3c04bfdd676ac8c8492cb2f6ce4e4c85152b76b76f295ac18e11ce647e70d15a2c46cf73874fbcf7cec146a9dc830c0253cdea25b29452673d06f')
sha512sums_i686=('60c6abe9571c4f6efa17128810f66f3fb46082e0590790511621e345e2206e4c4b5eff506f271a735a37a107e156159975af4bac09678596181dbfdf6fc9f8c4')
sha512sums_aarch64=('ed63320e47e1ef2f7b2818d2534943c7b0e6ab7aa0315302e3659006ccf58a6144b676669e8a51c18baec4b068924e651b941c0947af9031ea9b6d92c3871e68')
sha512sums_armv7h=('4b49dc4eff570a9b8b4569bdf845f99acd50836230f99f25eb36ac020369a0d21f6df711e6adc3dedf10660585d4faaa05222a697295baf39852455fb27bf7b7')

pkgver() {
    printf "%s" "$(echo $_pkgver | sed 's/-/\./g')"
}

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
