# Maintainer: Maxime "M4x1m3" FRIESS <M4x1me at protonmail dot com>
pkgname=gedit-plugin-discord-rpc-git
pkgver=4.72dca08
pkgrel=1
pkgdesc="A Discord RPC plugin for gedit."
arch=('any')
url="https://github.com/M4xi1m3/gedit-discord-rpc"
license=('MIT')
groups=()
depends=('gedit' 'python-pypresence')
makedepends=('git')
install=
source=("$pkgname::git+https://github.com/M4xi1m3/gedit-discord-rpc")
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname
	
	install -D -m 644 "discord-rpc.plugin" "${pkgdir}/usr/lib/gedit/plugins/discord-rpc/discord-rpc.plugin"
	install -D -m 644 "discord-rpc.py" "${pkgdir}/usr/lib/gedit/plugins/discord-rpc/discord-rpc.py"
	install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
