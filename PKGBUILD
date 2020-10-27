# Maintainer: Tamvana Makuluni <sw@makuluni.com>
pkgname=neovim-latex-previewer-git
pkgver=r15.286e5c3
pkgrel=1
pkgdesc="Neovim plugin to provide a live-updating PDF preview of LaTeX documents."
arch=('any')
url="http://github.com/emakman/neovim-latex-previewer"
conflicts=('neovim-latex-previewer')
provides=('neovim-latex-previewer')
license=('custom:Public Domain')
depends=('texlive-core' 'neovim' 'xdotool' 'mupdf' 'unionfs-fuse')
makedepends=('git')
source=('git+https://github.com/emakman/neovim-latex-previewer.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"

  local installpath="$pkgdir/usr/share/nvim/runtime"
  install -Dm644 doc/*.txt -t "$installpath/doc/"
  install -Dm644 ftplugin/tex/*.vim -t "$installpath/ftplugin/tex/"
}

# vim:set ts=2 sw=2 et:
