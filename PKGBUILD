# Maintainer: Alad Wenter <alad@archlinux.info>
# Contributor: Adam Reichold <adam.reichold@t-online.de>

pkgname=qpdfview-qt4
pkgver=0.4.16
pkgrel=3
pkgdesc='A tabbed PDF viewer using the poppler library.'
arch=('i686' 'x86_64')
url='https://launchpad.net/qpdfview'
license=('GPL2')
depends=('libcups' 'poppler-qt4' 'desktop-file-utils' 'hicolor-icon-theme' 
         'texlive-bin' 'libspectre' 'djvulibre')
install='qpdfview.install'
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
sha256sums=('fad416e8fefc3057fa1b8d12d964c7eccd16dffe0307a0d6e9d55a543294da7f')

build() {
  cd "$pkgname-$pkgver"

  lrelease-qt4 qpdfview.pro
  qmake-qt4 CONFIG+="$config" qpdfview.pro
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
}

