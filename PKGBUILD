# Maintainer: Kirill Klenov <horneds@gmail.com>
# Contributor: Mikhail felixoid Shiryaev <mr dot felixoid na gmail com>

pkgname=kotlin-vim
pkgver=1.1
pkgrel=1
pkgdesc='A vim Plugin on kotlin'
arch=('any')
license=('LGPL3')
url='https://github.com/udalov/kotlin-vim'
depends=('vim')
makedepends=('git')
source=("git+https://github.com/udalov/kotlin-vim.git#branch=master")
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package() {

  cd ${srcdir}/${pkgname}
  rm README.md
  mkdir -p ~/.vim/{syntax,indent,ftdetect}
  cp syntax/kotlin.vim ~/.vim/syntax/kotlin.vim
  cp indent/kotlin.vim ~/.vim/indent/kotlin.vim
  cp ftdetect/kotlin.vim ~/.vim/ftdetect/kotlin.vi

}

# vim:set ts=2 sw=2 et:


