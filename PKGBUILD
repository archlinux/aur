# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Christoph Zeiler <rabyte@gmail.com>

pkgname=onscripter
pkgver=20160407
pkgrel=1
pkgdesc="A game engine compatible to NScripter, to create and perform visual novel games"
arch=('i686' 'x86_64')
url="http://onscripter.sourceforge.jp/onscripter.html"
license=('GPL')
depends=('bzip2' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
source=("http://onscripter.sourceforge.jp/${pkgname}-${pkgver}.tar.gz"
        'avifile.patch')
        
md5sums=('29679673a332e3b3f00bdd9c579b93e2'
         '9eec223b2bb76e8e83ef4e67de87b2ae')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i ${srcdir}/avifile.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -f Makefile.Linux
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 onscripter "${pkgdir}/usr/bin/onscripter"
}
