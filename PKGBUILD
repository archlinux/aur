# Maintainer: peter1000 <https://github.com/peter1000>

_srcname=bs1770gain
pkgname=${_srcname}_p
pkgver=0.4.5
pkgrel=1
pkgdesc="A loudness scanner to measure and adjust audio and video sound loudness."
arch=('i686' 'x86_64')
url="http://bs1770gain.sourceforge.net/"
license=('GPL')
depends=('sox-git_p' 'ffmpeg-full-git_p')
source=("http://downloads.sourceforge.net/sourceforge/${_srcname}/${_srcname}-${pkgver}.tar.gz")
sha512sums=('9323a0b0aabc95413e49711eeb05a62d3c2d9a860db6bb822504a573110b80f9457a02f48eac730472679a2291c76c9de8fc2b2d0a3d9c796bc6e5550ea21988')

build() {
    cd "${srcdir}/${_srcname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_srcname}-${pkgver}"
    make prefix="${pkgdir}/usr" install
}
