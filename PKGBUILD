# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>
pkgname=git-who
pkgver=1.2
pkgrel=1
pkgdesc="Git blame for file trees"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/sinclairtarget/git-who"
license=('MIT')
depends=('glibc' 'git')
makedepends=('go' 'ruby-rake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sinclairtarget/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver" || exit
	rake
}

package() {
	cd "$pkgname-$pkgver" || exit
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
b2sums=('6f70a4f5a003b3036721fb052222e51aa184b1f430dd357ca321d232007d8e696d1631a5e85c821989613cf73b5d5838ddc922ba0a247e4f2bebcc574f3346c0')
# vim:set ts=2 sw=2 et:
