pkgname=rstudio-desktop-bin
pkgver=2026.04.0.526
_pkgver=`echo $pkgver | sed 's/\(.*\)\./\1-/'`
pkgrel=2
pkgdesc="An integrated development environment (IDE) for R (binary from RStudio official repository)"
arch=('x86_64')
license=('AGPL')
url="https://posit.co/products/open-source/rstudio/"
depends=('r>=3.3.0' 'sqlite' 'libxkbcommon')
optdepends=('clang: C/C++ and Rcpp code completion'
            'ttf-dejavu: fallback font support')
makedepends=()
conflicts=('rstudio-desktop' 'rstudio-desktop-git' 'rstudio-desktop-preview-bin')
provides=("rstudio-desktop=${pkgver}")
options=(!strip)

sha256sums_x86_64=('af4d87c03317ced1a0049ff67e4aaa3d5e7dcd67f4b598914b8de3e94e50039d')

source_x86_64=("https://download1.rstudio.org/electron/jammy/amd64/rstudio-${_pkgver}-amd64.deb")

package() {

  shopt -s extglob

  msg "Converting Debian package..."

  cd "$srcdir"
  tar Jxpf data.tar.xz -C "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"

  ln -s /usr/lib/rstudio/rstudio "$pkgdir/usr/bin/rstudio"

}
