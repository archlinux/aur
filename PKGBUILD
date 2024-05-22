# Maintainer: usagi-flow <>

pkgname=evil-helix-bin
pkgver=20240521
pkgrel=2
pkgdesc="Helix fork with Vim keybindings and more"
arch=('x86_64')
url="https://github.com/usagi-flow/evil-helix"
license=('MPL2')

provides=('helix')
conflicts=('helix')

source=("https://github.com/usagi-flow/evil-helix/releases/download/release-$pkgver/helix-amd64-linux.tar.gz")
sha512sums=("72b9e58e66f5fe58866c180b28eac4a86bb7eb901321a53fe159a2503cdc8b376ca4ad31468893dc62c8336c0d2577d81e941d1604e169f9aad6e9a507d10409")

options=('!debug' '!lto')

package() {
	install -d "$pkgdir/opt/helix"

	install -D -m755 helix/hx "$pkgdir/opt/helix/hx"
	cp -r helix/runtime "$pkgdir/opt/helix/"
}