# Contributor: der_FeniX <derfenix@gmail.com>

pkgname=semantik
pkgver=1.0.3
pkgrel=2
pkgdesc="mindmapping-like tool for document generation (reports, thesis, etc)"
arch=('i686' 'x86_64')
url="https://waf.io/semantik.html"
license=('GPL3')
depends=('qt5-webengine' 'qt5-svg' 'kdelibs4support' 'kio' 'python'
         'shared-mime-info' 'desktop-file-utils')
source=("https://github.com/ita1024/semantik/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('723a6850c3f003b44756ad1faa0cab48cf141c36956a2cb4a6da7ec749631458')


build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  PYTHON=python3 PYTHON_VERSION=3.6 ./waf configure build --prefix=/usr
}


package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  PYTHON=python3 PYTHON_VERSION=3.6 DESTDIR="${pkgdir}" ./waf install
}
