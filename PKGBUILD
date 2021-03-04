# Maintainer: Coelacanthus <coelacanthus@outlook.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Christoph Zeiler <rabyte@gmail.com>

pkgname=onscripter
pkgver=20200722
pkgrel=1
pkgdesc="A game engine compatible to NScripter, to create and perform visual novel games"
arch=('i686' 'x86_64')
url="http://onscripter.sourceforge.jp/onscripter.html"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'lua51' 'fontconfig')
source=("http://onscripter.sourceforge.jp/${pkgname}-${pkgver}.tar.gz"
        'avifile.patch')

b2sums=('5dbd734e5ca577e75cb51ef06018f0d6b862f1b13d913dc8e400a0725a22c8cca516e68432527c6c8ef62dc72fdc8985deb0ea63bcbb29386cac855bd8e4a3c0'
        'a334dbc3802d3d909839a96192080ff9aa8737d5fb592ce3989f112a6746134501da5e292664ed4a09118b99ec001dcf8eb1607c0597c56e326744f02f9ae2c2')

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
