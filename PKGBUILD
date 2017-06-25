# Contributor: Alad Wenter <alad@archlinux.info>
# Contributor: Adam Reichold <adam.reichold@t-online.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=qpdfview-qt4
pkgver=0.4.17beta1
pkgrel=1
pkgdesc='A tabbed PDF viewer using the poppler library.'
arch=('i686' 'x86_64')
url='https://launchpad.net/qpdfview'
license=('GPL2')
depends=('libcups' 'poppler-qt4' 'desktop-file-utils' 'hicolor-icon-theme' 
         'texlive-bin' 'libspectre' 'djvulibre')
conflicts=('qpdfview' 'qpdfview-bzr')
provides=('qpdfview')
source=("$url/trunk/$pkgver/+download/qpdfview-$pkgver.tar.gz")
sha256sums=('60206c5f76410a35098e3c965552cec08cd85941776ea6f6b207d7ea63ce940f')

build() {
  cd "qpdfview-$pkgver"

  lrelease-qt4 qpdfview.pro
  qmake-qt4 CONFIG+="$config" qpdfview.pro
  make
}

package() {
  cd "qpdfview-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
}

