# Maintainer: Junio Calu <junio.calu@gmail.com>

pkgname=deepin-ocr
pkgver=1.0.0
pkgrel=1
pkgdesc='Deepin OCR Tool'
arch=('x86_64')
url="https://github.com/linuxdeepin/deepin-ocr"
#provides=('deepin-ocr')
license=('GPL3')
depends=('glibc' 'dtkcore' 'dtkgui' 'dtkwidget' 'libexif' 'freeimage' 
	 'gio-qt' 'libglvnd' 'glib2' 'glibmm' 'lcms2' 'libpulse' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 
	 'qt5-x11extras' 'libraw' 'libsigc++' 'libstdc++5' 'udisks2-qt5' 'libx11' 'libxext' 
	 'qt5-imageformats' 'tesseract' 'tesseract-data-eng' 'tesseract-data-chi_sim' 'tesseract-data-chi_tra'
	 'python-pyocr' 'python-pytesseract' 'python-requests' 'python-sip4' 'python-xlib' 'xsel' 'python-xmltodict'
	 'python-xcffib')
makedepends=('qt5-tools' 'gcc-libs' 'fontconfig' 'freeimage' 'freetype2' 'mtdev' 'sqlite' 'systemd-libs' 'xcb-util' 'libxrender' 'pkgconfig' 'xorgproto')
#optdepends=()
groups=('deepin-extra')
source=("$pkgname-$pkgver.tar.xz::http://dropbox.com/s/sodgwycn3sbbun1/deepin-ocr_${pkgver}_src.tar.xz?dl=1")
sha256sums=('4923d0db3d24deda904543b3ac74d2360f3ad58013cfc121fb4bf0108c6edd98')

build() {
  cd deepin-ocr-$pkgver
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS_ISYSTEM=
  make
}

package() {
  cd deepin-ocr-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
