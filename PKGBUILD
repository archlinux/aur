# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=freecheck-git
pkgver=0.30_8_g9806307
pkgrel=1
_branch=devel
url="https://github.com/alerque/${pkgname%-git}"
pkgdesc='A blank check printer that adds MICR codes and check templates to blank stock'
arch=('any')
license=('GPL2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('perl' 'gnumicr')
makedepends=(git)
optdepends=(
      'cups: printing support'
      'ghostscript: output to pdf files'
    )
source=("git+$url.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/-/_/g'
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make prefix="$pkgdir"/ install
}
