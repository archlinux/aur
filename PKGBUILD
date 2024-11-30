# Maintainer: Daniele Bartolini <dbartolini crownengine org>

replaces=('pepper')
pkgname=crown
pkgver=0.53.0
pkgrel=2
pkgdesc="A complete and cross-platform game engine designed for flexibility, performance, and fast-iterations."
arch=(x86_64)
url="https://www.crownengine.org"
license=('MIT' 'GPL3')
depends=('glib2>=2.64.6'
         'gtk3>=3.24'
         'libgee'
         'libgl'
         'libpulse'
         'libx11'
         'libxrandr'
         )
source=("https://github.com/crownengine/crown/releases/download/v$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        "crown.sh"
        )
sha256sums=('43855ca169a86d745f623bf3a23de555cd16aff0290e380c924ad1acc906c1a4'
            '1021e6be0e8a5ef6303e4be4c75555c51079e1ce8bbf54ca04168f7c29bf0341')
options=('!strip')

package() {
    install -d "$pkgdir"/opt
    cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname

    # Launcher.
    install -D -m755 crown.sh "${pkgdir}/usr/bin/crown"

    # License.
    install -D -m644 $pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # .desktop and icons.
    install -D -m644 $pkgname-$pkgver/org.crownengine.Crown.desktop "${pkgdir}/usr/share/applications/org.crownengine.Crown.desktop"
    install -D -m644 $pkgname-$pkgver/org.crownengine.Crown.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.crownengine.Crown.svg"
}
