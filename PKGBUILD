# Maintainer: Eric Nielsen <ericbn at proton dot me>

pkgname=zimfw
pkgver=1.21.1
pkgrel=1
pkgdesc='Zsh plugin manager'
arch=('any')
url='https://zimfw.sh'
license=('MIT')
depends=('zsh>=5.2')
makedepends=('ruby-erb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zimfw/zimfw/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9f07f6a20adb958acd85b94bdc28895f17dc6773cf95fbc841fabd23eddbcb83')
install=zimfw.install

build() {
	cd "$pkgname-$pkgver"
	ZIMFW_VENDOR='Arch Linux AUR' make -B
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0644 -t "$pkgdir/usr/share/zimfw" zimfw.zsh
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
