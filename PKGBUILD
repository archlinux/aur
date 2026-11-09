# Maintainer: Eric Nielsen <ericbn at proton dot me>

pkgname=zimfw
pkgver=1.21.0
pkgrel=1
pkgdesc='Zsh plugin manager'
arch=('any')
url='https://zimfw.sh'
license=('MIT')
depends=('zsh>=5.2')
makedepends=('ruby-erb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zimfw/zimfw/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1772f20f893b8181a60855e988c16b24b10e6c537b1e27d859d443c20ea7be57')
install=zimfw.install

build() {
	cd "$pkgname-$pkgver"
	ZIMFW_VENDOR='Arch Linux AUR' erb src/zimfw.zsh.erb > zimfw.zsh
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0644 -t "$pkgdir/usr/share/zimfw" zimfw.zsh
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
