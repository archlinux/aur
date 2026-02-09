# Maintainer: fenuks

_pkgver=0.22
_pkgrel=07
_file=gtk-wave-cleaner-${_pkgver}-${_pkgrel}
pkgname=gwc
pkgver=${_pkgver}_${_pkgrel}
pkgrel=1
pkgdesc="Gtk Wave Cleaner is a digital audio editor to denoise, dehiss and amplify audio files"
arch=("i686" "x86_64")
url="http://gwc.sourceforge.net/"
license=("GPL")
depends=("libsndfile" "gtk2" "fftw")
optdepends=("vorbis-tools: for ogg export"
            "lame: for mp3 export")
makedepends=("make")
provides=("${pkgname}")
conflicts=("${pkgname}")
# install=$pkgname.install
source=("https://github.com/AlisterH/gwc/releases/download/${_pkgver}-${_pkgrel}/${_file}.tar.gz")
sha256sums=('8efde942390231abd9c0d0991572b459b3610bbf80adb33d220f81031c03dccf')

prepare() {
    cd "${srcdir}/${_file}"
    ./configure --prefix=/usr
}

build() {
    cd "${srcdir}/${_file}"
    make
}

package() {
    cd "${srcdir}/${_file}"
    make DESTDIR="${pkgdir}/" install
}
