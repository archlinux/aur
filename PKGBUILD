# Maintainer: phanium <$(echo bnhoc2R1QHFxLmNvbQo= | base64 -d)>

pkgname=fifc
pkgver=0.1.1
pkgrel=1
pkgdesc="fifc brings fzf powers on top of fish completion engine and allows customizable completion rules"
arch=('any')
url="https://github.com/gazorby/fifc"
license=('MIT')
groups=('fish-plugins')
depends=('fish' 'fzf')
optdepends=(
  'bat: Preview files'
  'chafa: Preview images'
  'hexyl: Preview binaries'
  'fd: Complete paths'
  'exa: Preview directories'
  'ripgrep: Search options in man pages'
  'procs: Complete processes and preview their tree'
  'broot: Explore directory trees'
)

install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5c26d8ea9387e7582d97d444e6ea99f2b634844e82d83c4363866aac0cd9dc33')

package() {
	cd "$pkgname-$pkgver"
	install -Dvm644 completions/*.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dvm644 conf.d/*.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	install -Dvm644 functions/*.fish -t "$pkgdir/usr/share/fish/vendor_functions.d/"
	install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
