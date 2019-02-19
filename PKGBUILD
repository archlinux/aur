pkgname=mock-core-configs
pkgver=30.1
_rpmrel=1
_pkgtag=$pkgname-$pkgver-$_rpmrel
pkgrel=$_rpmrel.1
pkgdesc="Mock core config files basic chroots"
url="https://github.com/rpm-software-management/mock"
arch=('any')
license=('GPL2')
depends=('distribution-gpg-keys>=1.29')
source=("$url/archive/$_pkgtag.tar.gz")
md5sums=('bf0181a01f4605c4072351d727999579')

prepare() {
	mv "mock-$_pkgtag" "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"

	pushd "$pkgname" >/dev/null

	mkdir -p "$pkgdir/"etc/mock
	install -Dp -m644 etc/mock/*.cfg "$pkgdir/"etc/mock/
	mkdir -p "$pkgdir/"etc/mock/eol
	install -Dp -m644 etc/mock/eol/*.cfg "$pkgdir/"etc/mock/eol/

	popd >/dev/null
}

# vim: set ft=sh ts=4 sw=4 noet:
