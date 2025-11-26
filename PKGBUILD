# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
pkgname=albafetch-bin
pkgver=4.3
pkgrel=2
pkgdesc="Neofetch, but written in C; both faster and worse than the original (binary build)"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/albafetch"
license=('MIT')
depends_x86_64=(pciutils sqlite glib2)
depends_aarch64=(sqlite glib2)
makedepnds=(git)
conflicts=(albafetch-git albafetch)
provides=(albafetck=$pkgver)
source_x86_64=("$url/releases/download/v$pkgver/albafetch-linux-x64.zip")
source_aarch64=("$url/releases/download/v$pkgver/albafetch-linux-aarch64-static.zip")

backup=("etc/xdg/albafetch.conf")

md5sums_x86_64=('4bfdc07abd95419603a1d57f64445580')
md5sums_aarch64=('74184f997f277a43561d59b2d01185a4')

package() {
    install -Dm755 "$srcdir/albafetch" "$pkgdir/usr/bin/albafetch"

    install -Dm644 "$srcdir/../LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/../README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "$srcdir/../albafetch.conf" "$pkgdir/etc/xdg/albafetch.conf"
}

