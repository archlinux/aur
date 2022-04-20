# Maintainer: Ayatale <ayatale@qq.com>

pkgname=deepl-api-rs
pkgver=0.1.2
pkgrel=1
pkgdesc="Free deepL api, written in rust."
url="https://github.com/zu1k/deepl-api-rs"
arch=("x86_64")
license=("Unlicense")
depends=()
provides=("deepl-api")
source=("deepl-api.service"
        "${url}/releases/download/${pkgver}/deepl-${arch}-unknown-linux-musl-${pkgver}.gz")
sha256sums=("bc151aa4bc7433a895eda895a2ba831968a8a27826369eedea9d68bc6a86d4cc"
            "acb974bdc50d267d20a615b5f5890f7bae90609c6406bb7b63d0e6b2930d16bf")

package() {
    install -Dm644 "deepl-api.service" -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm755 "deepl-${arch}-unknown-linux-musl-${pkgver}" "$pkgdir/usr/bin/deepl-api"
}
