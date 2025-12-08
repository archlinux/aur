# Maintainer: David Keegan <me@davidkeegan.com>
pkgname=piper-speak
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple text-to-speech wrapper for Piper TTS on Linux"
arch=('any')
url="https://github.com/kgn/piper-speak"
license=('MIT')
depends=('piper-tts' 'pipewire-pulse' 'wl-clipboard' 'curl')
optdepends=('libnotify: for speak-selection notifications')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kgn/piper-speak/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba3acde44e0b7c9d425d0ebbdea66f8d1bce8e3c0e20ca6c7344edea18c8a60c')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 bin/piper-speak "$pkgdir/usr/bin/piper-speak"
    install -Dm755 bin/speak-selection "$pkgdir/usr/bin/speak-selection"
    install -Dm755 bin/piper-speak-install "$pkgdir/usr/bin/piper-speak-install"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
