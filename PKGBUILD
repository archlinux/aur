# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=kryptor-bin
pkgver=4.1.1
pkgrel=1
pkgdesc='A simple, modern, and secure encryption and signing tool that aims to be a better version of age and Minisign.'
arch=('x86_64' 'aarch64')
url='https://www.kryptor.co.uk/'
license=('GPL3')
source_x86_64=("https://github.com/samuel-lucas6/Kryptor/releases/download/v$pkgver/kryptor-linux-x64.zip")
source_aarch64=("https://github.com/samuel-lucas6/Kryptor/releases/download/v$pkgver/kryptor-linux-arm64.zip")
sha512sums_x86_64=('3545af5a45c32a20c58a23649fe416396140f84c360ba6db95f50d0096cecdfa17c50a08287e1570dcff0d449605e2e172192b0eca47d1d3c8e9e777c64a123a')
sha512sums_aarch64=('70433b709fa4352da8e27e8e6b6483ea9785a5f0ebdbdf899934c1b1c9966e5c5e34ba971d4e7af5ecbfad4b230858187189639c140f5ef365f0eb247e7cd9f7')
conflicts=('kryptor')
provides=('kryptor')
# Important to disable binary strip, otherwise the artifact would be corrupted
options=(!strip)

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/kryptor" "${pkgdir}/usr/bin/kryptor"
}
