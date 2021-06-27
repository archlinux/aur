# Maintainer: taotieren <admin@taotieren.com>

pkgname=rustdesk-bin
pkgver=1.1.6
pkgrel=1
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
#install=${pkgname}.install
source=("${url}/releases/download/${pkgver}/rustdesk-${pkgver}-manjaro-arch.pkg.tar.zst")
sha256sums=('dbfd6ea2e6994f5157f5794049796a06ea94d424c41121f30181e6ff48fbcaa3')

noextract=("rustdesk-${pkgver}-manjaro-arch.pkg.tar.zst")

prepare() {
    bsdtar -xf "${srcdir}/rustdesk-${pkgver}-manjaro-arch.pkg.tar.zst"
}

package() {
     cp -r "${srcdir}/usr" "${pkgdir}/"
}
