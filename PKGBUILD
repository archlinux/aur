# Maintainer: Remco Stoeten
pkgname=kiekje-bin
pkgver=0.1.0alpha6
pkgrel=1
_tag=0.1.0-alpha.6
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
sha256sums_x86_64=('eb600c015f1ec63291637d64dbc67ee931fffd0e52b98e0580c35f3b3623f3cb')
sha256sums_aarch64=('4338162062ef2435422083440280835e1e38fc18866774917c47c3cc8e68b783')

package() {
    cd "kiekje-$_tag-$CARCH-linux"
    DESTDIR="$pkgdir" PREFIX=/usr packaging/install.sh ./kiekje
}
