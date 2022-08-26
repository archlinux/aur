# Maintainer: Saksham Gupta <sakshamdam54321 at gmail dot com>
pkgname=payload-dumper-go-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="an android OTA payload dumper written in Go"
arch=('x86_64')
url="https://github.com/ssut/payload-dumper-go"
license=('Apache')
depends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz"
        "$url/raw/$pkgver/LICENSE")
sha256sums=('55015ae32ee0156bd9b64c58c6c1d7753773a286232254af3b0c67fcc8d7960a'
            '4a26a47cfc98fcad333c3e1ccda022cdeb0e19cde4f1fe4aef4a51f621769922')

package() {
    tar -xvf "${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz" "${pkgname%-bin}"
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
}
