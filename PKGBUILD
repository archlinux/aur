pkgname=rstudio-desktop-bin
pkgver=2026.05.0.218
_pkgver=`echo $pkgver | sed 's/\(.*\)\./\1-/'`
pkgrel=1
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

sha256sums_x86_64=('5959099f5957d2d752e78b7cad34059646173cfad594e6536e73a2e5f750b8c1')

source_x86_64=("https://download1.rstudio.org/electron/jammy/amd64/rstudio-2026.05.0-218-amd64.deb")

package() {

  shopt -s extglob

  msg "Converting Debian package..."

  cd "$srcdir"
  tar Jxpf data.tar.xz -C "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"

  ln -s /usr/lib/rstudio/rstudio "$pkgdir/usr/bin/rstudio"

}
