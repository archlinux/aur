# Maintainer: usagi-flow <>

pkgname=evil-helix-bin
pkgver=20240524
pkgrel=1
pkgdesc="Helix fork with Vim keybindings and more"
arch=('x86_64')
url="https://github.com/usagi-flow/evil-helix"
license=('MPL2')

provides=('helix')
conflicts=('helix')

source=("https://github.com/usagi-flow/evil-helix/releases/download/release-$pkgver/helix-amd64-linux.tar.gz")
sha512sums=("3d99d1d3171c7bb426f21acb4ca4f3a792bb2e9749831b3774db69dd8b1f7a72267d33d5e5941b2d6d4727080eba346ce91b51a81baa5a7c9bc7766b03607293")

options=('!debug' '!lto')

package() {
	install -d "$pkgdir/opt/helix"

	install -D -m755 helix/hx "$pkgdir/opt/helix/hx"
	cp -r helix/runtime "$pkgdir/opt/helix/"
}