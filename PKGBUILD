# Maintainer: der_FeniX <derfenix@gmail.com>

pkgname=semantik
pkgver=0.9.4
pkgrel=1
arch=('i686' 'x86_64')
url="https://code.google.com/p/semantik/"
makedepends=('waf')
license=('GPL')
source=("http://ftp.waf.io/pub/release/${pkgname}-${pkgver}.tar.bz2" 'install')

pkgdesc="A mindmapping-like tool for document generation (reports, thesis, etc)"
depends=('kdebase-runtime')
install='install'

sha256sums=('940a3b37700f1e88b6c29ff13e0d33a73832f0db856a8738b3e939d8f0c73aa2'
            'a981f2afe77ec69545b3912a99ee6c560388d178cd39c9a21ae21e270024159b')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/0755/755/g' wscript
  PYTHON=python2 PYTHON_VERSION=2.7 waf configure build
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=python2 PYTHON_VERSION=2.7 waf install --destdir="${pkgdir}" 
}
