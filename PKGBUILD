# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Ariel Popper <a@arielp.com>

pkgname=vim-airline-git
pkgver=0.7.r217.g8c860b7
pkgrel=2
epoch=1
pkgdesc="A lean & mean statusline for vim that's light as air."
arch=('any')
url='https://github.com/vim-airline/vim-airline'
license=('GPL')
depends=('vim')
makedepends=('git')
conflicts=('vim-airline')
provides=('vim-airline')
groups=('vim-plugins')
optdepends=('otf-powerline-symbols-git: use the Powerline symbols'
            'vim-airline-themes-git: alternative themes')
install='airline.install'
md5sums=('SKIP')

source=("git+https://github.com/vim-airline/${pkgname%-git}.git")

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  local vimfiles="${pkgdir}/usr/share/vim/vimfiles"

  mkdir -p "${vimfiles}"
  cp -r autoload doc plugin t "${vimfiles}"
}
