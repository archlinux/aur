# Maintainer: Remco Stoeten
pkgname=kiekje-bin
pkgver=0.1.0alpha7
pkgrel=1
_tag=0.1.0-alpha.7
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
)
provides=('kiekje')
conflicts=('kiekje')
options=('!strip' '!debug')
source_x86_64=("kiekje-$_tag-x86_64-linux.tar.gz::$url/releases/download/v$_tag/kiekje-$_tag-x86_64-linux.tar.gz")
source_aarch64=("kiekje-$_tag-aarch64-linux.tar.gz::$url/releases/download/v$_tag/kiekje-$_tag-aarch64-linux.tar.gz")
sha256sums_x86_64=('032c08b8e3016e4d896968651aced8e17c2f24598e556b0f2ab94311411c3d18')
sha256sums_aarch64=('189926d85b936e175acd64917e49e0c7ed3d7edb921735251a6e06788c14d177')

package() {
    cd "kiekje-$_tag-$CARCH-linux"
    DESTDIR="$pkgdir" PREFIX=/usr packaging/install.sh ./kiekje
}
