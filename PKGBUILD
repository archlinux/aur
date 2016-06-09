# Maintainer: der_FeniX <derfenix@gmail.com>

pkgname=semantik
pkgver=0.9.4
pkgrel=3
arch=('i686' 'x86_64')
url="https://ita1024.github.io/semantik/"
makedepends=('waf')
license=('GPL')
source=("https://github.com/ita1024/semantik/archive/${pkgname}-${pkgver}.tar.gz" 'install')

pkgdesc="A mindmapping-like tool for document generation (reports, thesis, etc)"
depends=('kdebase-runtime')
install='install'

sha256sums=('479fb3e822e7c4bc887019071bdf9fb8e2fad951ae6b54e5c76fba8e738dc684'
            'a981f2afe77ec69545b3912a99ee6c560388d178cd39c9a21ae21e270024159b')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  sed -i 's/0755/755/g' wscript
  PYTHON=python2 PYTHON_VERSION=2.7 waf configure build
}


package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  PYTHON=python2 PYTHON_VERSION=2.7 waf install --destdir="${pkgdir}" 
}
