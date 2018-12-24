# Maintainer: Trent Palmer trenttdually at gmail
_name='nvim-yarp'
pkgname="${_name}-git"
pkgver=r45.1524cf7
pkgrel=1
pkgdesc="(an) attempt (at) writing a remote plugin framework without :UpdateRemotePlugins."
arch=('any')
url="https://github.com/roxma/nvim-yarp"
license=('MIT')
groups=()
depends=('vim' 'python-neovim')
makedepends=('git') 
provides=('nvim-yarp')
conflicts=()
replaces=('')
backup=()
options=()
# maybe at some point there will be helptags to update
install="${_name}.install"
source=("${_name}::${url//https/git}")
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
