# Maintainer: Nilesh Kevlani <njkevlani@gmail.com>
pkgname=passpicker-bin
pkgver=0.0.3
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
sha256sums_x86_64=('8205ca43f048979b9fafcdda321c3d1328327d690897e394df6af7f579f8bd52')
sha256sums_aarch64=('4de8d9309d6daee326e2a39c9378ea36c6624233296037dfbdd41e266d425b40')

package() {
  install -Dm755 "passpicker-$pkgver-$CARCH" "$pkgdir/usr/bin/passpicker"
  install -Dm644 "passpicker.desktop-$pkgver" "$pkgdir/usr/share/applications/passpicker.desktop"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
