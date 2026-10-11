# Maintainer: Remco Stoeten
pkgname=kiekje-bin
pkgver=0.1.0alpha4
pkgrel=1
_tag=0.1.0-alpha.4
pkgdesc='Capture, mark up and keep screenshots (release binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/remcostoeten/kiekje'
license=('MIT' 'OFL-1.1')
depends=('gtk4' 'wayland' 'glib2' 'cairo' 'pango' 'fontconfig' 'gdk-pixbuf2' 'graphene' 'gcc-libs' 'glibc')
optdepends=(
    'xdg-desktop-portal: capture and global shortcuts through the portal'
)
provides=('kiekje')
conflicts=('kiekje')
options=('!strip' '!debug')
source_x86_64=("kiekje-$_tag-x86_64-linux.tar.gz::$url/releases/download/v$_tag/kiekje-$_tag-x86_64-linux.tar.gz")
source_aarch64=("kiekje-$_tag-aarch64-linux.tar.gz::$url/releases/download/v$_tag/kiekje-$_tag-aarch64-linux.tar.gz")
sha256sums_x86_64=('4cff4251cb41c130613a92c14c9a0e3f7abf6f5d2fe6281264b03f4c02d2cd55')
sha256sums_aarch64=('2af247fa698ea620759ea151cd7523d9a36f442163564a67445060c18b6c42c3')

package() {
    cd "kiekje-$_tag-$CARCH-linux"
    DESTDIR="$pkgdir" PREFIX=/usr packaging/install.sh ./kiekje
}
