# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Army [uli.armbruster (the google thing)]

_pkgname=pim
pkgname=pim-git
pkgver=0.8.0.r15.gfba920f
pkgrel=1
pkgdesc="Python image viewer with vim-like keybindings. Git-Version"
arch=('any')
url="https://github.com/Narrat/Pim"
license=('MIT')
depends=('desktop-file-utils' 'python-gobject')
makedepends=('git')
conflicts=('pim')
provides=('pim=0.8.0')
source=('pim::git://github.com/Narrat/Pim.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}/${_pkgname}

  install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -D -m644 LICENSE-MIT $pkgdir/usr/share/licenses/${_pkgname}/LICENSE
  install -D -m644 pim.desktop "${pkgdir}/usr/share/applications/pim.desktop"
}
