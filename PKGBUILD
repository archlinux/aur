# Maintainer: Korbinian Reischl <info@korbireischl.de>
# Contributor: Kira Sokolova <Kyra256@proton.me>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=klog-time-tracker-bin
pkgver=7.2
pkgrel=1
pkgdesc="A plain-text file format and a command line tool for time tracking."
arch=('x86_64' 'aarch64')
url="https://github.com/jotaen/klog"
license=('MIT')
provides=("${pkgname%-bin}=$pkgver")
conflicts=('klog' "${pkgname%-bin}")

source_x86_64=("$pkgname-$pkgver-x86_64.zip::$url/releases/download/v$pkgver/klog-linux-amd64.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::$url/releases/download/v$pkgver/klog-linux-arm64.zip")

sha256sums_x86_64=('5857c548fc707a46c4451123cf7945c7cdc1a0f6ebdd6dbd1da71de3c6a57781')
sha256sums_aarch64=('5a948d409781b05f8098d08c2dbbd2f826a29cd92eb480f619daebd3a376bcdb')

package() {
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 klog "$pkgdir/usr/bin/klog"
}
