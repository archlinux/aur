# Maintainer: Simon Jacquin <simon@jacquin.me>

pkgname=openmha
pkgver=4.18.1
pkgrel=1
pkgdesc='The open Master Hearing Aid (openMHA)'
url='https://www.openmha.org'
arch=('any')
license=('AGPL-3.0-or-later')
sha256sums=('18901d74a51bc27238c13fae4806c7e9c1c952870f74c6527c04239e95475651')

depends=(
    'libsndfile'
    'portaudio'
    'liblo'
    'liblsl'
    'eigen3'
)

source=("https://github.com/HoerTech-gGmbH/openMHA/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "openMHA-${pkgver}"

    ./configure --prefix=/usr
    make -j"$(nproc)"
}

package() {
    cd "openMHA-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
