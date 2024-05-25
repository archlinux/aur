# Maintainer: Trent Palmer trenttdually at gmail

###########################################################################################################
#                                          Build Options
###########################################################################################################
_vim="y"

# if you have a newer version of neovim you may not need or want to set _neovim="y"
_neovim="n"
###########################################################################################################

pkgname='vimscripts-autoclose'
_srcpkgname='AutoClose'
pkgver=1.2
pkgrel=3
epoch=
pkgdesc="plugin that automatically closes quote, parentheses, brackets, braces, etc"
arch=('any')
url="https://github.com/vim-scripts/AutoClose"
license=('unknown')
groups=()
depends=('vim' 'neovim')
makedepends=()
checkdepends=()
optdepends=()
provides=('vimscripts-autoclose')
conflicts=('vim-auto-pairs')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/vim-scripts/AutoClose/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('8eb8630367d6978f3e2696df27eff4eb')
validpgpkeys=()

package() {
  if [ "$_neovim" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/nvim/runtime"
    cp -r "${srcdir}/${_srcpkgname}-${pkgver}/plugin" \
        "$pkgdir/usr/share/nvim/runtime"
  fi
    
  if [ "$_vim" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/vim/vimfiles"
    cp -r "${srcdir}/${_srcpkgname}-${pkgver}/plugin" \
        "$pkgdir/usr/share/vim/vimfiles"
  fi

    install -D -m644 "${srcdir}/${_srcpkgname}-${pkgver}/README" $pkgdir/usr/share/doc/$pkgname/README
}
