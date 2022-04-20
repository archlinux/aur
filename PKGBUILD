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
sha256sums=('8761bbdbaf5f73244d244a88cd96f7857d1209b372d72aba9c7c71d870c478bb'
            'acb974bdc50d267d20a615b5f5890f7bae90609c6406bb7b63d0e6b2930d16bf')

package() {
    install -Dm644 "deepl-api.service" -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm755 "deepl-${arch}-unknown-linux-musl-${pkgver}" "$pkgdir/usr/bin/deepl-api"
}
