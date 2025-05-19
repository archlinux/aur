# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>
pkgname=git-who
pkgver=1.0
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
b2sums=('2cbf26593d4522d78cef02ae79ab7eed99f87b919df39faee3eab1ddfe325a1a2bd64029f2afada77985479ed93db904186da14fe5036c4c9890d44dd96f5b51')
# vim:set ts=2 sw=2 et:
