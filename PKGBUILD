# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=kryptor-bin
pkgver=4.0.1
pkgrel=1
pkgdesc='A simple, modern, and secure encryption and signing tool that aims to be a better version of age and Minisign.'
arch=('x86_64' 'aarch64')
url='https://www.kryptor.co.uk/'
license=('GPL3')
source_x86_64=("https://github.com/samuel-lucas6/Kryptor/releases/download/v$pkgver/kryptor-linux-x64.zip")
source_aarch64=("https://github.com/samuel-lucas6/Kryptor/releases/download/v$pkgver/kryptor-linux-arm64.zip")
sha512sums_x86_64=('d517a7e38220eb0a8a2937768ca85b660c10224b0ddc64a509f8e3b81f9db04162de6f2316ee38acce6839f9ad140f53013100f7a76bc25b79ae310d0c75e3f3')
sha512sums_aarch64=('549b44059e4074a4f7bba27a7b94fe74e2785f87c59fd9cbbe4feedd0ecc88478323960499e0a862ddcb5e82a1d9fa324101b06024cb5259d71c3bd9c6a6d408')
conflicts=('kryptor')
provides=('kryptor')
# Important to disable binary strip, otherwise the artifact would be corrupted
options=(!strip)

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/kryptor" "${pkgdir}/usr/bin/kryptor"
}
