# Maintainer: notscripter <grx8x0mfy@mozmail.com>
pkgname=spotube-nightly-bin
pkgver=5.0.0
pkgrel=2
epoch=
pkgdesc="🎧 Open source music client! Available for both desktop & mobile!"
arch=(i686 x86_64)
url="https://github.com/KRTirtho/spotube"
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
options=()
install=
changelog=
source=(spotube-linux-nightly-x86_64-$pkgver-$pkgrel.tar.xz::https://github.com/KRTirtho/spotube/releases/download/nightly/spotube-linux-nightly-x86_64.tar.xz)
noextract=()
sha256sums=(260e82b6d3c089443680be93cf96ae3b3c5f7692893b19b10f9386c3afa37a74)
validpgpkeys=()

package() {
    cd ${srcdir}
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/spotube"

    install -Dm755 ./spotube.desktop "$pkgdir/usr/share/applications/spotube.desktop"
    install -Dm755 ./spotube-logo.png "$pkgdir/usr/share/icons/spotube/spotube-logo.png"
    install -Dm755 ./com.github.KRTirtho.Spotube.appdata.xml "$pkgdir/usr/share/appdata/spotube.appdata.xml"
    cp -ra ./data ./lib ./spotube "$pkgdir/usr/share/spotube"
    ln -s /usr/share/spotube/spotube "${pkgdir}/usr/bin/spotube"
}
