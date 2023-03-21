# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-wiki
pkgver=0.5
pkgrel=1
pkgdesc="A wiki plugin for Vim"
arch=('any')
url="https://github.com/lervag/wiki.vim"
license=('MIT')
groups=('vim-plugins')
depends=('python' 'vim-plugin-runtime')
optdepends=('vim-wiki-ft: Wiki filetype plugin'
            'pandoc: WikiExport support')
provides=('vim-ctrlp-wiki' 'vim-coc-wiki' 'vim-unite-wiki')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8c262565c21679e861d211649bcea778ad495774ba172d7de778195bdd2da942')

package() {
	local dirs=(autoload doc plugin pythonx)
	cd "wiki.vim-$pkgver"
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
