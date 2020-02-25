# Maintainer: Ronan Pigott <rpigott@berkeley.edu>

pkgname=blight
pkgver=0.0.4
pkgrel=1
pkgdesc='Basic general backlight utility written in python'
url='https://github.com/RPigott/blight'
arch=('any')
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
		"$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
depends=('python' 'python-gobject')

sha256sums=('09479aa27762414b8914a97ed09234a41d53fa4e3a3b69d5773ac5aa4f084fc9'
            'SKIP')
# validpgpkeys=('AE54EAF95DC5D7BB5F1CF422E8E098BBF6E920A0') # Ronan Pigott <rpigott@berkeley.edu>

package() {
	install -Dm755 blight.py "$pkgdir/usr/bin/blight"
	install -Dm644 completion/zsh/_blight "$pkgdir/usr/share/zsh/site-functions/_blight"
	install -Dm644 completion/bash/blight "$pkgdir/usr/share/bash-completion/completions/blight"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/blight/LICENSE"
}
