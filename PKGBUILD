# Maintainer: Tmplt <ttemplate[at]gmail[dot]com>

_npmname=instant-markdown-d
_npmver=0.1.0
pkgname=vim-instant-markdown
pkgver=0.1.0
pkgrel=1
pkgdesc="Instant Markdown previews from vim in a browser"
arch=(any)
license=(unknown)
url="https://github.com/suan/vim-instant-markdown#readme"
depends=('nodejs' 'npm' 'wget' 'vim')
optdepends=('neovim: neovim support')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz
        https://raw.githubusercontent.com/suan/vim-instant-markdown/master/after/ftplugin/markdown/instant-markdown.vim)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('457cda23129183b01a97e96de9e598680fa0cee6c7c9a40db0f830cd7031fa81'
            '0e9970e1d90c691a40dbda576c310a8555ee93059a5686aca7469b95d948ceca')
install=install.sh

package() {
  mkdir -p "$pkgdir/usr/lib/node_modules/"
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/autoload/"
  mkdir -p "$pkgdir/usr/share/vim/vimfiles/after/ftplugin/markdown"

  cd "$pkgdir/usr/lib/node_modules/"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver

  cp "$srcdir/instant-markdown.vim" "$pkgdir/usr/share/vim/vimfiles/after/"
}

# vim: set ts=2 sw=2
