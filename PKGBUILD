# Maintainer: sum01 <sum01@protonmail.com>
pkgname=vcash-rpc-git
_srcname="vcash-bash-rpc"
pkgver=r10.843f87b
pkgrel=1
pkgdesc="Bash RPC script for Vcash."
arch=('any')
url="https://github.com/openvcash/vcash-bash-rpc"
license=('Unknown')
depends=('bash' 'jq' 'vcash')
makedepends=('git')
conflicts=('vcash-rpc')
provides=('vcash-rpc')
source=("git+https://github.com/openvcash/vcash-bash-rpc.git")
sha512sums=('SKIP')
pkgver() {
	cd "$srcdir/$_srcname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	install -Dm755 "$srcdir/$_srcname/rpc.sh" "$pkgdir/usr/bin/vcashrpc"
}
