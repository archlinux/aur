# Maintainer: Alex Gentilucci <alexander.gentilucci@gmail.com>

_npmname=instant-markdown-d
_npmver=0.1.0
pkgname=vim-instant-markdown
pkgver=0.1.0
pkgrel=7
pkgdesc="Instant Markdown previews from vim in a browser"
arch=(any)
license=(unknown)
url="https://github.com/suan/vim-instant-markdown#readme"
depends=('nodejs' 'npm' 'wget')
optdepends=('neovim: neovim support' 'vim: vim support')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz"
        "https://raw.githubusercontent.com/suan/vim-instant-markdown/master/after/ftplugin/markdown/instant-markdown.vim")
noextract=($_npmname-$_npmver.tgz)
sha256sums=('457cda23129183b01a97e96de9e598680fa0cee6c7c9a40db0f830cd7031fa81'
            'f0d1698ff135649c5c9061896f194bbdaebe1701cfc81635ebc75b06bfc68228')
install=install.sh

package() {
  mkdir -p "$pkgdir/usr/lib/node_modules/"
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/autoload/"
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/after/ftplugin/markdown"

  cd "$pkgdir/usr/lib/node_modules/"
	npm install                    \
	    --global                     \
			--no-save                    \
			--production                 \
			--user   root                \
			--cache  "$srcdir/npm-cache" \
			--prefix "$pkgdir/usr"       \
			"$_npmname-$_npmver.tgz"

  cp "$srcdir/instant-markdown.vim" "$pkgdir/usr/share/vim/vimfiles/after/ftplugin/markdown"
}

# vim: set ts=2 sw=2
