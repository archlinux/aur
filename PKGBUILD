# Maintainer: Ronan Pigott <rpigott@berkeley.edu>

pkgname=blight
pkgver=0.1.2
pkgrel=1
pkgdesc='Basic general backlight utility written in python'
url='https://github.com/rpigott/blight'
arch=('any')
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
makedepends=('scdoc')
depends=('python' 'python-gobject')
sha256sums=('e2fa4f6b1436240ad047628e4e793506339460eb0bf650b8dbfb50152805a565')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	scdoc < blight.1.scd > blight.1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 blight.py "$pkgdir/usr/bin/blight"
	install -Dm644 blight.1 "$pkgdir/usr/share/man/man1/blight.1"
	install -Dm644 completion/zsh/_blight "$pkgdir/usr/share/zsh/site-functions/_blight"
	install -Dm644 completion/bash/blight "$pkgdir/usr/share/bash-completion/completions/blight"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/blight/LICENSE"
}
