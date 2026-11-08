# Maintainer: Remco Stoeten
pkgname=kiekje-bin
pkgver=0.1.0alpha13
pkgrel=1
_tag=0.1.0-alpha.13
pkgdesc='Capture, mark up and keep screenshots (release binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/remcostoeten/kiekje'
license=('MIT' 'OFL-1.1')
depends=('gtk4' 'wayland' 'glib2' 'cairo' 'pango' 'fontconfig' 'gdk-pixbuf2' 'graphene' 'gcc-libs' 'glibc')
optdepends=(
    'xdg-desktop-portal: capture and global shortcuts through the portal'
    'gst-plugins-base: capture sound'
    'gst-plugins-good: capture sound through PulseAudio, and screen recording'
    'gst-plugin-pipewire: screen recording'
    'tesseract: copying the text in a region'
    'tesseract-data-eng: English for text capture; add tesseract-data-nld and others for more languages'
)
provides=('kiekje')
conflicts=('kiekje')
options=('!strip' '!debug')
source_x86_64=("kiekje-$_tag-x86_64-linux.tar.gz::$url/releases/download/v$_tag/kiekje-$_tag-x86_64-linux.tar.gz")
source_aarch64=("kiekje-$_tag-aarch64-linux.tar.gz::$url/releases/download/v$_tag/kiekje-$_tag-aarch64-linux.tar.gz")
sha256sums_x86_64=('8dd1d1a0806bc7a526e9bc32aef444e1d5b715cd159f685dbf8202f4cd4724bd')
sha256sums_aarch64=('01e05c56bbdd43d3a2894612a385d9495eb05088ff369f7b15bc9e471a0d36d6')

package() {
    cd "kiekje-$_tag-$CARCH-linux"
    DESTDIR="$pkgdir" PREFIX=/usr packaging/install.sh ./kiekje
}
