# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
_pkgver=2.1.0
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

sha512sums_x86_64=('dfffdb8ff04fa56e2c72008a74a583e44b6816c6a4a4703a5961bd51e57b9c89330710596366d4c3bb63c88d338f05f4274d01410d5446f1c418e5d4f0c5d541')
sha512sums_i686=('69321a8e409342e1575c9c2966276e7fb4719e400785e1020ebe51539d3e98c5de6da8145f31d9cd5ce56ba10103de524a8ca036ad09375ce4184ed0dc46a433')
sha512sums_aarch64=('04b088b9183fa078ec9e466cacff8247328060d860861d4a7f013d6b96a50ce498bd0550c76a1568572fc1fa436905862888f75d1633df531c4e8de0eda77d06')
sha512sums_armv7h=('ecc6556d33e7de41ffef8333cdeac2a32a67a1defe54d4eb5ff3032360c8c4b22b13fe8fd864d139e564b75e1793aef5b10d2fead330ada26371dd80cfbfa4f8')

pkgver() {
    printf "%s" "$(echo $_pkgver | sed 's/-/\./g')"
}

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
