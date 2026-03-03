# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Victor Zamanian <victor.zamanian@gmail.com>

pkgname=pomotroid-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple and visually-pleasing Pomodoro timer"
arch=('x86_64')
url="https://github.com/Splode/pomotroid"
license=('MIT')
source=("https://raw.githubusercontent.com/Splode/pomotroid/v$pkgver/"{LICENSE,README.md})
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/Pomotroid_${pkgver}_amd64.deb")
sha256sums=('26c9bfaefad8fafa79e3f2c403bf75438f099f1847da304f43fda117b5ca6658'
            'f892af1d26f61fcbaddebcf06a40717c7b998751d47e8c74012b0e3f7573af2e')
sha256sums_x86_64=('a16db74476ce07eba8ecc113918e781a4cce6b26fd970b8429f730e094e7c0ef')

package() {
    depends=(libwebkit2gtk-4.1.so libcairo.so libsoup-3.0.so libgobject-2.0.so libgtk-3.so libgio-2.0.so libasound.so libgcc_s.so)
    tar xf data.tar.gz -C "$pkgdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
}
