# Maintainer: Mrinmoy <grx8x0mfy@mozmail.com>
pkgname=spotube-nightly-bin
pkgver=5.0.0+42
pkgrel=1
epoch=
pkgdesc="🎧 Open source music client! Available for both desktop & mobile!"
arch=(x86_64 aarch64)
url="https://spotube.krtirtho.dev"
license=('BSD-4')
groups=()
depends=('mpv' 'libappindicator-gtk3' 'libsecret' 'jsoncpp' 'libnotify' 'xdg-user-dirs' 'webkit2gtk-4.1')
makedepends=()
checkdepends=()
optdepends=('yt-dlp-git')
provides=(spotube)
conflicts=(spotube)
replaces=()
backup=()
options=(!debug)
install=
changelog=
source_x86_64=($pkgname-$pkgver-$pkgrel.tar.xz::https://github.com/KRTirtho/spotube/releases/download/nightly/spotube-linux-nightly-x86_64.tar.xz)
source_aarch64=($pkgname-$pkgver-$pkgrel.tar.xz::https://github.com/KRTirtho/spotube/releases/download/nightly/spotube-linux-nightly-aarch64.tar.xz)
noextract=()
sha256sums_x86_64=(7ab2f68841058c45b33f82834ddf767f7ec1c4c3bf16363c56baf9acba2a37ec)
sha256sums_aarch64=(0f915d97c039bc38c9bd04a4015cc6d6bf3dcdf5778798356c3490900ed0b3b4)
validpgpkeys=()

package() {
    install -dm755 "${pkgdir}/usr/share/icons/spotube"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/appdata"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"

    mv ./spotube.desktop "${pkgdir}/usr/share/applications"
    mv ./spotube-logo.png "${pkgdir}/usr/share/icons/spotube/"
    cp -ra ./data ./lib ./spotube "${pkgdir}/usr/share/${pkgname}"
     
    ln -s "/usr/share/${pkgname}/spotube" "${pkgdir}/usr/bin/spotube"
}
