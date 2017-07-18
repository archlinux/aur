# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
_pkgname='vim-easymotion'
pkgname=${_pkgname}-git
pkgver=v3.0.1.r37.ge4d71c7
pkgrel=1
pkgdesc="simpler and faster vim motions"
arch=('any')
url="https://github.com/easymotion/vim-easymotion"
license=('unknown')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=()
backup=()
options=()
install=vimdoc.install
noextract=()
source=("$pkgname::git+https://github.com/easymotion/vim-easymotion.git")
sha1sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles/"
  cp -r autoload doc plugin t "${pkgdir}/usr/share/vim/vimfiles/"
  rm -f "$pkgdir/usr/share/vim/vimfiles/autoload/vital.vim"
}
