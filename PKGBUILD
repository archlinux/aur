# Maintainer: Trent Palmer trenttdually at gmail
_name='vim-hug-neovim-rpc'
pkgname="${_name}-git"
pkgver=r118.93ae387
pkgrel=2
pkgdesc="trying to build a compatibility layer for neovim rpc client working on vim8"
arch=('any')
url="https://github.com/roxma/vim-hug-neovim-rpc"
license=('MIT')
groups=()
depends=('vim' 'python-neovim')
optdepends=('nvim-yarp')
makedepends=('git') 
provides=('vim-hug-neovim-rpc')
conflicts=()
replaces=('')
backup=()
options=()
# maybe at some point there will be helptags to update
install="${_name}.install"
source=("git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/share/vim/vimfiles"
  cp -r "${srcdir}/${_name}/"{autoload,pythonx} \
    "$pkgdir/usr/share/vim/vimfiles"

  install -D -m644 "${srcdir}/${_name}/README.md" $pkgdir/usr/share/doc/$pkgname/README.md
}
