# Maintainer: Maxim Moseychuk <franchesko.salias.hudro.pedros@gmail.com>
# Maintainer: oozyslug <oozyslug at gmail dot com>
# Contributor: oozyslug <oozyslug at gmail dot com>
# Submitter: oozyslug <oozyslug at gmail dot com>

_pkgname=antigen
pkgname=antigen-git
pkgver=v1.4.1.r0.g0bc49f9
pkgrel=2
pkgdesc="A plugin manager for zsh, inspired by oh-my-zsh and vundle."
arch=('any')
url="https://github.com/zsh-users/antigen"
source=("git+https://github.com/zsh-users/antigen")
md5sums=('SKIP')
license=('MIT')
depends=('zsh')
makedepends=('git' 'make')
install='antigen.install'

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $srcdir/$_pkgname
    make PREFIX=$pkgdir/usr/share/zsh build install
}
