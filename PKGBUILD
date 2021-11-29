# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=sndcpy-bin
pkgver=1.1
pkgrel=1
pkgdesc="Android audio forwarding (scrcpy, but for audio)"
arch=('x86_64')
url="https://github.com/rom1v/sndcpy"
license=('MIT')
depends=('bash' 'vlc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver.zip"
        "$url/raw/v$pkgver/LICENSE"
        "${pkgname%-bin}.sh")
sha256sums=('b045320ddddbc5a237d6d95213c664f03b2f46ef8bbfcef91c2d95644ed42bbc'
            '6b6d5219c4732200fdf483c5a9bde69867a1386b6278c176ce3598c32132e66d'
            '51eb4996dd266cd8e5e362d388982d250a285218642737c4464291de0808203e')

package() {
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/opt/${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.apk" -t "$pkgdir/opt/${pkgname%-bin}"
  install -Dm755 "${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
}
