# Maintainer: Caleb Maclennan <caleb@alerque.com>
_pkgname=freecheck
pkgname=freecheck-git
pkgver=0.30_4_g3f4fe6f
pkgrel=3
_branch=devel
url=https://github.com/alerque/$_pkgname
pkgdesc='A blank check printer that adds MICR codes and check templates to blank stock.'
arch=('any')
license=('GPL2')
conflicts=("$_pkgname")
depends=('perl' 'gnumicr')
optdepends=(
      'cups: printing support'
      'ghostscript: output to pdf files'
    )
source=("git://github.com/alerque/$_pkgname.git#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/^v//;s/-/_/g'
}

package() {
    cd "$srcdir/$_pkgname"
    make prefix=$pkgdir/ install
}

