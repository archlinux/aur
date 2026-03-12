# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Victor Zamanian <victor.zamanian@gmail.com>

pkgname=pomotroid-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple and visually-pleasing Pomodoro timer"
arch=('x86_64')
url="https://github.com/Splode/pomotroid"
license=('MIT')
source=("https://raw.githubusercontent.com/Splode/pomotroid/v$pkgver/"{LICENSE,README.md})
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/Pomotroid_${pkgver}_amd64.deb")
sha256sums=('26c9bfaefad8fafa79e3f2c403bf75438f099f1847da304f43fda117b5ca6658'
            'd93140b2eeb81f1c5670f34b1c1d47753b4917b7c0f03d194cbcf6aa982f1035')
sha256sums_x86_64=('578533681bcc969c10fd40e25bcd8461808a7baaa81cf5745462f9ee31448eab')

package() {
    depends=(libwebkit2gtk-4.1.so libcairo.so libsoup-3.0.so libgobject-2.0.so libgtk-3.so libgio-2.0.so libasound.so libgcc_s.so)
    tar xf data.tar.gz -C "$pkgdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
}
