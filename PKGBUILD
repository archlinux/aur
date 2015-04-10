# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Federico Cinelli <cinelli@aur.archlinux.org>

pkgname=texmaker-qt4
pkgver=4.4.1
pkgrel=1
pkgdesc='Free cross-platform LaTeX editor'
arch=('i686' 'x86_64')
url="http://www.xm1math.net/texmaker/index.html"
license=('GPL')
depends=('poppler-qt4' 'qtwebkit' 'desktop-file-utils')
optdepends=('ghostscript: LaTeX to HTML conversion command'
            'poppler: PDF rendering support')
install="$pkgname.install"
source=("http://www.xm1math.net/texmaker/texmaker-$pkgver.tar.bz2")
sha256sums=('80939493ffb6c92f47c47109dff6de4c91259244247e90ddfb1bb6153559b4b4')
conflicts=('texmaker')
provides=('texmaker')

build() {
  cd "texmaker-$pkgver"
  qmake-qt4 PREFIX=/usr texmaker.pro
  make
}
package() {
  cd "$srcdir/texmaker-$pkgver"

  install -dm755 "$pkgdir/usr/share"
  make INSTALL_PATH="$pkgdir" INSTALL_ROOT="$pkgdir" PREFIX="/usr" install
}

