# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
_pkgver=2.0.2
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

sha512sums_x86_64=('5b61245c25f9dea9221e03f0db0662357033c37cae8c1574fc4ead4f2b32c4bc3c5fafd24fd6c464bf5646c8bda2c2de35a6800952af5e60c39d415d7652fee4')
sha512sums_i686=('9553d49e4db9b2f2a1ee6da399d65f899c6a363b8a143c04a7a59eaa24b685a7f3433239f68f889de1ae1925e549e1efdeff5885471098abaacf787b407d2e5b')
sha512sums_aarch64=('17520cfe32c101e71110e70d0b2a86fa0c556ed396412d820b550bb3b05d4a9053c387816628dbed15b3d1c408e5abdfc9f5ee3bbce7986c6196cb1811ae0939')
sha512sums_armv7h=('ff994f38888587bbd166b0b392a8aa203898c5d00f9fdca8d9eabf4d1f5e6b8ac8242f53bf48853bdb2819fba32805bf9172143ef6cae8e634b0f3b4b11613ad')

pkgver() {
    printf "%s" "$(echo $_pkgver | sed 's/-/\./g')"
}

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
