# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-fzf
pkgver=10.2
pkgrel=1
pkgdesc="fzf key-bindings into fish"
arch=('any')
url="https://github.com/PatrickF1/fzf.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish' 'fzf>=0.33')
optdepends=(
	'fd: required for search directory feature'
	'bat: required for search directory feature'
	'git')
makedepends=('git')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ef1daeedee6de3c0ca6e6b0517757fbaaf87485bd73784a017f5db4d63dca4fc')

package() {
	cd "fzf.fish-$pkgver/"
	install -Dvm644 completions/*.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dvm644 conf.d/*.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	install -Dvm644 functions/*.fish -t "$pkgdir/usr/share/fish/vendor_functions.d/"
	install -Dvm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
