# Maintainer: 1ay1 <https://github.com/1ay1>
# Generated automatically by .github/workflows/release.yml — do not edit by hand.
pkgname=neowall-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="GPU shader wallpapers for Wayland and X11 (prebuilt binary)"
arch=('x86_64')
url="https://github.com/1ay1/neowall"
license=('MIT')
depends=('wayland' 'mesa' 'libpng' 'libjpeg-turbo' 'libx11' 'libxrandr' 'libxkbcommon')
provides=('neowall')
conflicts=('neowall' 'neowall-git')
options=(!strip !debug)
source=("neowall-$pkgver-x86_64.tar.gz::https://github.com/1ay1/neowall/releases/download/v0.10.1/neowall-linux-x86_64-arch.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/1ay1/neowall/v0.10.1/LICENSE")
sha256sums=('579e82f36d7c1a8d645fb5bc769282276a3f052dfcd79d9b9650bed1c2e9f7bb'
            'SKIP')

package() {
  install -Dm755 "$srcdir/neowall" "$pkgdir/usr/bin/neowall"
  if [ -d "$srcdir/share/neowall" ]; then
    install -dm755 "$pkgdir/usr/share"
    cp -r "$srcdir/share/neowall" "$pkgdir/usr/share/neowall"
    find "$pkgdir/usr/share/neowall" -type f -exec chmod 644 {} +
  fi
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
