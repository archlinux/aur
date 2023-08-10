# Maintainer: Christopher Schnick <crschnick@xpipe.io>

pkgname=xpipe
pkgver=1.5.0
pkgrel=1
epoch=1
pkgdesc="A brand-new shell connection hub and remote file manager"
arch=('x86_64')
url="https://github.com/xpipe-io/xpipe"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/xpipe-io/xpipe/releases/download/${pkgver}/xpipe-portable-linux-x86_64.tar.gz"
	"xpipe.desktop")
noextract=()
sha512sums=("SKIP" "SKIP")

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/xpipe.desktop"
	install -d "$pkgdir"/usr/bin
	ln -s "/opt/$pkgname/cli/bin/xpipe" "$pkgdir/usr/bin/xpipe"
	install -d "$pkgdir"/etc/bash_completion.d
	ln -s "/opt/xpipe/cli/xpipe_completion" "$pkgdir/etc/bash_completion.d/xpipe"
}