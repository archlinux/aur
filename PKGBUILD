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

sha512sums_x86_64=('bc948ab4ee8132fca8440aaec2f99f0a2ad257eae31f25443e8d8abdfaf80e044826f96937afdaee2ab985c8a9c05c92b0aa12da1d3d1c2f543db5d90af87eb7')
sha512sums_i686=('7ee443429d3584dbe6f7745a7c79ae82f7e460ab02415bc42bc6efdfc01e2651bda42610463f87cad912d501282db994a5534054b964071217689a10bb7b559c')
sha512sums_aarch64=('7431fa70d83f9f4a0a759debf25dfec86ca57b20eeaf8feb32bb83eae8e2b773902b0650a63c5ab2eb67e28123cbc82c920ce0426204fab29044d7754014e46f')
sha512sums_armv7h=('c5ee8a294b55688be5fd4dd4da84b07c28c8d19b561c75f1b647a44e67dba8ab60524e9e42c30ed82f759c5ebadf46e34ed5388a5f28a6951df0346242c36b80')

pkgver() {
    printf "%s" "$(echo $_pkgver | sed 's/-/\./g')"
}

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
