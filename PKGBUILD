# Maintainer: Kingtous <me@kingtous.cn>
pkgname=rustplayer
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="An local audio player & m3u8 radio player using Rust and completely terminal guimusical_note. 使用Rust开发的纯终端本地/m3u8网络电台播放器musical_note."
arch=('x86_64')
url="https://github.com/kingtous/rustplayer"
license=('GPL-3.0')
groups=()
depends=('ffmpeg4.4')
makedepends=(dpkg)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Kingtous/RustPlayer/releases/download/latest/rustplayer_1.1.1_amd64.deb")
noextract=()
sha256sums=('8e78de7ee8a77d9bdce914e6990a7312e0a8df61d7b8715f9f08ee9b70cf2c41')
validpgpkeys=()


build() {
    # Download prebuilt deb package
    dpkg -X rustplayer_1.1.1_amd64.deb extract
}


package() {
    sed -i "s/Terminal=false/Terminal=true/g" "${srcdir}/extract/usr/share/applications/rustplayer.desktop"
    cp -r "${srcdir}/extract/usr"  "${pkgdir}/usr"
}
