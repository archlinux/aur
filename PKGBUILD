# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx at yahoo dot com dot tw>

pkgname=mp3guessenc
pkgver=0.27.5
pkgrel=1
pkgdesc="A program which guesses which MP3 encoder was used to encode a given MP3 file"
arch=('i686' 'x86_64')
#url="http://shibatch.sourceforge.net/"
url="http://mp3guessenc.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=("https://sourceforge.net/projects/mp3guessenc/files/${pkgname}-${pkgver%.*}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6c2cbac77c33a6f77876c255724a733d78b70001fed3444ed8e212cbf9d243b9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
