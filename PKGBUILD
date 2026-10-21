# Maintainer: Martin Kopecký <kopecky@thekrew.app>
pkgname=spot-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='TOML+CSS dialog runtime for Wayland (layer-shell overlays), prebuilt binary'
arch=('x86_64')
url='https://github.com/KopyTKG/spot'
license=('MIT')
depends=('glibc' 'gtk4' 'gtk4-layer-shell')
provides=('spot')
conflicts=('spot' 'spot-git')

_release="$url/releases/download/v$pkgver"
source=("spot-$pkgver::$_release/spot-linux-x64"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/KopyTKG/spot/v$pkgver/LICENSE")
noextract=("spot-$pkgver")
sha256sums=('4eba039285c5563741a510a66eb8485811e6d5b38203ec612665c6162e3fbe43'
            'e41890a77c45861b0d2213e1c192b441725327e8bea70d7ffc3d3618c2f65bdf')

package() {
  install -Dm755 "$srcdir/spot-$pkgver" "$pkgdir/usr/bin/spot"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
