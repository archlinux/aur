# Maintainer: esrh : email at esrh.me/pages/contact.html
pkgname=ames
pkgver=v0.1.6
pkgrel=1
pkgdesc="Update anki cards with desktop audio and images"
arch=('any')
url="https://github.com/eshrh/ames"
license=('GPL3')
depends=('pulse-native-provider' 'ffmpeg' 'maim' 'xdotool' 'libnotify' 'xclip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eshrh/ames/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('018b14b1e5d36d86a1af29a76d540917de2b6a276c6e4e7dbc8cea5b2c3a2d99')
install="ames.install"

package() {
    tar -xzf "$pkgname-$pkgver.tar.gz"
    cd "$srcdir/$pkgname-${pkgver:1}"
    install -Dm755 ames.sh "$pkgdir"/usr/bin/ames
    install -Dm644 config "$pkgdir"/usr/share/ames/config
    install -Dm644 ames.1 "$pkgdir"/usr/share/man/man1/ames.1
}
