# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=kryptor-bin
pkgver=4.1.0
pkgrel=1
pkgdesc='A simple, modern, and secure encryption and signing tool that aims to be a better version of age and Minisign.'
arch=('x86_64' 'aarch64')
url='https://www.kryptor.co.uk/'
license=('GPL3')
source_x86_64=("https://github.com/samuel-lucas6/Kryptor/releases/download/v$pkgver/kryptor-linux-x64.zip")
source_aarch64=("https://github.com/samuel-lucas6/Kryptor/releases/download/v$pkgver/kryptor-linux-arm64.zip")
sha512sums_x86_64=('56ec83613e9a12e0a94cff8a7baebc7b4f6adfa1f9fbb286b3d240135fe11c048b60c1edc2e7875791291c75d85b9c54178fcc303da55893c199b931f13d4a77')
sha512sums_aarch64=('d9938d2d64023633496e294280397e4f2132d2c8dcf39dc89844d59a079b8a397c56c8372e8a561a48cd244a75f5401820acd92ad58990b27b3d508fe2cc6399')
conflicts=('kryptor')
provides=('kryptor')
# Important to disable binary strip, otherwise the artifact would be corrupted
options=(!strip)

package() {
  cd "$srcdir/"
  install -Dm755 "${srcdir}/kryptor" "${pkgdir}/usr/bin/kryptor"
}
