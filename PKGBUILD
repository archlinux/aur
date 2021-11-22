# Maintainer: taotieren <admin@taotieren.com>

pkgname=rustdesk-bin
pkgver=1.1.8
pkgrel=2
pkgdesc="Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk! "
arch=('x86_64')
url="https://github.com/rustdesk/rustdesk"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-bin} ${pkgname/bin/git} )
#replaces=(${pkgname})
depends=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'pulseaudio')
# 'libsciter-gtk-bin'
makedepends=('unzip' 'zip' 'pkg-config' 'make' 'git' 'cmake' 'gcc' 'curl' 'wget' 'rust' 'yasm' 'nasm' 'clang')
backup=()
options=('!strip')
install=${pkgname}.install
source=("https://ghproxy.com/https://github.com/rustdesk/rustdesk/releases/download/${pkgver}/rustdesk-${pkgver}-manjaro-arch.pkg.tar.zst"
        "${pkgname}.install")
sha256sums=('8fe8f3179ebdc8660ffdf70c39386894dc25780183101ef464d99fc97eb881d3'
            'b6cf25e231687a6caf178a87113b74482354aea2f8a3f6b8b5800169ce55fb10')

noextract=("rustdesk-${pkgver}-manjaro-arch.pkg.tar.zst")

prepare() {
    bsdtar -xf "${srcdir}/rustdesk-${pkgver}-manjaro-arch.pkg.tar.zst"
}

package() {
     cp -r "${srcdir}/usr" "${pkgdir}/"
}
