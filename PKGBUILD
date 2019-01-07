# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=mp3guessenc
pkgver=0.27.4
pkgrel=2
pkgdesc="A program which guesses which MP3 encoder was used to encode a given MP3 file"
arch=('i686' 'x86_64')
#url="http://shibatch.sourceforge.net/"
url="http://mp3guessenc.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=("https://sourceforge.net/projects/mp3guessenc/files/${pkgname}-${pkgver%.*}/${pkgname}-${pkgver}.tar.gz"
        "mp3guessenc-flags.patch")
sha256sums=('f7492ed3861d64fa12b8e912674e0ca33b35cdcfeaf33d48745b404d7dbcba18'
            '156f414e377b9ab1f3964e993b1526c7321c78b1165515f32f69a86e8e2a0663')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/mp3guessenc-flags.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
