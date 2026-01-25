# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>
pkgname=git-who
pkgver=1.3
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
b2sums=('0c86900c2849b5262e8f87814888b2d3385b78c2db5eec5672491fb8fe5bca7420db27c776cff89d320d165f27106274d5402a0e48787206b2c3ec258337b941')
# vim:set ts=2 sw=2 et:
