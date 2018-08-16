pkgname=mock-core-configs
pkgver=29.2
_rpmrel=1
_pkgtag=$pkgname-$pkgver-$_rpmrel
pkgrel=$_rpmrel.1
pkgdesc="Mock core config files basic chroots"
url="https://github.com/rpm-software-management/mock"
arch=('any')
license=('GPL2')
depends=('distribution-gpg-keys')
source=("$url/archive/$_pkgtag.tar.gz")
md5sums=('063b0bfdd20427f509523b1c56355567')

prepare() {
	mv "mock-$_pkgtag" "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"

	pushd "$pkgname" >/dev/null

	mkdir -p "$pkgdir/"etc/mock
	install -Dp -m644 etc/mock/*.cfg "$pkgdir/"etc/mock/

	popd >/dev/null
}

# vim: set ft=sh ts=4 sw=4 noet:
