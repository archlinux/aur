# vcalv
pkgname=vim-nushell
_pkgname=nushell-syntax-vim
pkgver=0.2.0
pkgrel=2
pkgdesc="Nushell syntax highlighting and indentation for Vim"
arch=('any')
url="https://github.com/elkasztano/nushell-syntax-vim"
license=('custom')
groups=('vim-plugins')
depends=('vim')
source=(https://github.com/elkasztano/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=(e5d2a7122451f995c07f4742ef7769017a13fa281f95d2482da897fd959a9cf1be2344a8ec3a7e27f893540083ea464915b1eb4fe3494ad87c21d3c5943ef143)

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  for d in ftdetect  ftplugin  indent syntax; do
  	install -Dm644 "$d"/nu.vim "$pkgdir/usr/share/vim/vimfiles/$d/nu.vim"
  done
  	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
