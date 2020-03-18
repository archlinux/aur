# Maintainer: Ronan Pigott <rpigott@berkeley.edu>

pkgname=blight
pkgver=0.1.0
pkgrel=1
pkgdesc='Basic general backlight utility written in python'
url='https://github.com/RPigott/blight'
arch=('any')
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
makedepends=('scdoc')
depends=('python' 'python-gobject')
sha256sums=('5c6e8d5fda8213cbab5c0ff319fa0f78c13fd6657d7b351e3e9a6a79dd912058')

# source+=("$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
# sha256sums+=('SKIP')
# validpgpkeys=('AE54EAF95DC5D7BB5F1CF422E8E098BBF6E920A0') # Ronan Pigott <rpigott@berkeley.edu>

build() {
	scdoc < blight.1.scd > blight.1
}

package() {
	install -Dm755 blight.py "$pkgdir/usr/bin/blight"
	install -Dm644 blight.1 "$pkgdir/usr/share/man/man1/blight.1"
	install -Dm644 completion/zsh/_blight "$pkgdir/usr/share/zsh/site-functions/_blight"
	install -Dm644 completion/bash/blight "$pkgdir/usr/share/bash-completion/completions/blight"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/blight/LICENSE"
}
