# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
pkgname=albafetch-bin
pkgver=4.1
pkgrel=1
pkgdesc="Neofetch, but written in C; both faster and worse than the original (binary build)"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/albafetch"
license=('MIT')
depends_x86_64=(pciutils libcurl-gnutls)
depends_aarch64=()
conflicts=(albafetch-git albafetch)
provides=(albafetch=4.1)
source_x86_64=("$url/releases/download/v$pkgver/albafetch-linux-x64.zip")
source_aarch64=("$url/releases/download/v$pkgver/albafetch-linux-aarch64-static.zip")

md5sums_x86_64=('3e177e4efa423511ead69debf5c53ff5')
md5sums_aarch64=('4e0949e75055f016f2685d6a323ff70f')

package() {
    install -Dm755 "$srcdir/albafetch" "$pkgdir/usr/bin/albafetch"

    install -Dm644 "$srcdir/../LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/../README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "$srcdir/../MANUAL.md" "$pkgdir/usr/share/doc/${pkgname}/MANUAL.md"

    install -Dm644 "$srcdir/../albafetch.conf.example" "$pkgdir/etc/xdg/albafetch.conf.example"
}

