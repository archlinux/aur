# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>
# Contributor : Daniel Chesters <archlinux@coin-coin.xyz>
pkgname=git-who
pkgver=0.7
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
b2sums=('48f951711f566a1436c830bf26b2bb0c2ca4ecf35909db79fc1f209bd03576d3ea25121b038574dc19a035d24829785eeafd5bfad6b1995131e20d505bff5539')
# vim:set ts=2 sw=2 et:
