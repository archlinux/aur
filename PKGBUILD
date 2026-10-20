# Maintainer: Nilesh Kevlani <njkevlani@gmail.com>
pkgname=passpicker-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="Menu-driven frontend for password-store"
arch=('x86_64' 'aarch64')
url="https://github.com/njkevlani/passpicker"
license=('MIT')
depends=('pass' 'rofi')
optdepends=('pass-otp: OTP support' 'libnotify: desktop notifications')
provides=('passpicker')
source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
        "passpicker.desktop-$pkgver::$url/raw/v$pkgver/resources/passpicker.desktop")
source_x86_64=("passpicker-$pkgver-x86_64::$url/releases/download/v$pkgver/passpicker-linux-amd64")
source_aarch64=("passpicker-$pkgver-aarch64::$url/releases/download/v$pkgver/passpicker-linux-arm64")
sha256sums=('4d902b7cbf33cd971eae1e5a15c6cdbc26b6c69c320e4702b9c64040de0c8b13'
            '77b3452042960eb982aa1510b79baefcc98bae5ecfc7ae7436eb262adffc9d8e')
sha256sums_x86_64=('43013881fa2fb586f381fdf1c33cfd5b1ce9041bd18cfb4ca48cad9fe7e34167')
sha256sums_aarch64=('85ceaee69e2142e7ef01e334ff4638a8e02baa4469105a65df19e39e76dcb4e2')

package() {
  install -Dm755 "passpicker-$pkgver-$CARCH" "$pkgdir/usr/bin/passpicker"
  install -Dm644 "passpicker.desktop-$pkgver" "$pkgdir/usr/share/applications/passpicker.desktop"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
