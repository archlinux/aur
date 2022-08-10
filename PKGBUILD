# Maintainer: esrh : email at esrh.me/pages/contact.html
pkgname=ames
pkgver=v0.1.5
pkgrel=1
pkgdesc="Update anki cards with desktop audio and images"
arch=('any')
url="https://github.com/eshrh/ames"
license=('GPL3')
depends=('pulseaudio' 'ffmpeg' 'maim' 'xdotool' 'libnotify' 'xclip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eshrh/ames/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5da565b974880fd22639699baca12bd8d831e886f44a9a8af8fc0b0786dbae46')
install="ames.install"

package() {
    tar -xzf "$pkgname-$pkgver.tar.gz"
    cd "$srcdir/$pkgname-${pkgver:1}"
    install -Dm755 ames.sh "$pkgdir"/usr/bin/ames
    install -Dm644 config "$pkgdir"/usr/share/ames/config
    install -Dm644 ames.1 "$pkgdir"/usr/share/man/man1/ames.1
}
