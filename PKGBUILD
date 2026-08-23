# Maintainer: Adrià Arrufat <swiftscythe at gmail dot com>
pkgname=mpv-jamak
pkgver=0.1.0
pkgrel=1
pkgdesc='Interactive OpenSubtitles downloader for mpv in pure Lua'
arch=('any')
url='https://github.com/arrufat/mpv-jamak'
license=('MIT')
depends=('mpv' 'curl')
optdepends=('subliminal: fallback when the OpenSubtitles API has no results')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('edfc89a783bf881b65eed0902ba9fdfc6a7e24bc63e18d6eb26a5d86b489d48b')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 main.lua "$pkgdir/etc/mpv/scripts/jamak/main.lua"
    install -Dm644 jamak.conf.example -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
