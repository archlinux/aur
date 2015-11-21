# Maintainer: Ramana Kumar <ramana(at)member.fsf.org>
pkgname=vim-inkpot-git
pkgver=r9.b86ad4d
pkgrel=1
pkgdesc="Inkpot, a dark scheme for GUI and 88/256 colour terms"
arch=('i686' 'x86_64')
url="http://github.com/ciaranm/inkpot"
license=('GPL')
depends=('vim')
makedepends=('git')
provides=('vim-inkpot')
conflicts=('vim-inkpot')
groups=('vim-plugins')
source=('git://github.com/ciaranm/inkpot.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/inkpot"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/inkpot"
  install -D colors/inkpot.vim ${pkgdir}/usr/share/vim/vimfiles/colors/inkpot.vim || return 1
}
