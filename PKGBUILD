# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
_pkgver=2.0.1
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

sha512sums_x86_64=('cd8b256a5e51d613cd8cf3be8ad0f9669a05de38e77c8bf8513333dfd7c8657436ceffa1df517e37fb38328d82c18fef0fe8527e227e6dcdcb76775d9eb69ef2')
sha512sums_i686=('b3e59d02a72cfae502cbdf6dd8273e65a7ddda31fade6417f98ab7c249a020ac4dcdd61c26d0ef8d0f2f5e98d25adda4e16a76adbe4bece155cfdfb873937cca')
sha512sums_aarch64=('78131f5669e0742856b0d5981b1e1831bd9be40ef8246b956c06553170a343b551fb0c277fa9a92738d0ed23e411e414544d3c4ce063ba0463971f7e92c9ec16')
sha512sums_armv7h=('c621173e8a0aa25aaa20cc73f888656706e7b0d20ab569d587e9c4b0feeccead1afd54ddfe3fd174a150c5cd9f7f59e8683a509dca6b442d597555f02b7f2d3f')

pkgver() {
    printf "%s" "$(echo $_pkgver | sed 's/-/\./g')"
}

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
