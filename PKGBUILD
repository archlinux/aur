# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
_pkgname=urxvt-vim-scrollback
pkgname=${_pkgname}-git
pkgver=r18.e177d2f
pkgrel=1
pkgdesc='an extension for urxvt which provides a vim like scrollback mode and pasting'
arch=('any')
url="https://github.com/ervandew/${_pkgname}"
license=('GPL')
depends=('rxvt-unicode')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
source=("${_pkgname}::git+https://github.com/ervandew/${_pkgname}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D -m 644 \
    "$srcdir/${_pkgname}/vim-scrollback" \
    "$pkgdir/usr/lib/urxvt/perl/vim-scrollback"
  install -D -m 644 \
    "$srcdir/${_pkgname}/README.rst" \
    "$pkgdir/usr/share/doc/${_pkgname}/README.rst"
}
