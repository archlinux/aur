# Maintainer: oozyslug <oozyslug at gmail dot com>
# Contributor: oozyslug <oozyslug at gmail dot com>
# Submitter: oozyslug <oozyslug at gmail dot com>

_pkgname=antigen
pkgname=antigen-git
pkgver=r358.7860ce7
pkgrel=1
pkgdesc="A plugin manager for zsh, inspired by oh-my-zsh and vundle."
arch=('any')
url="https://github.com/zsh-users/antigen"
source=("git+https://github.com/zsh-users/antigen")
md5sums=('SKIP')
license=('MIT')
depends=('zsh')
makedepends=('git')
install='antigen.install'

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $srcdir/$_pkgname
    mkdir -p $pkgdir/usr/share/zsh/scripts/antigen
    cp -R ./ $pkgdir/usr/share/zsh/scripts/antigen
    cd $pkgdir/usr/share/zsh/scripts/antigen
    rm -R .git
}
