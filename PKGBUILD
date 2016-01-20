# Maintainer: Rasmus Steinke <rasi at xssn dot at>
# Revived from: Vincent Berset <msieurhappy@gmail.com>

pkgname=mpd-sima
pkgver=0.14.1
pkgrel=1
pkgdesc="Automagically add title to mpd playlist based on last.fm recomendations"
arch=('any')
url="http://codingteam.net/project/sima"
license=('GPL')
depends=('python' 'python-musicpd')
makedepends=('make')
source=("http://codingteam.net/project/sima/download/file/mpd_sima-$pkgver.tar.xz")

build() {
    cd "$srcdir/MPD_sima-${pkgver}"

    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' \
        mpd-sima simadb_cli
}

package() {
    cd "${srcdir}/MPD_sima-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

md5sums=('81368753f1d696276e850a9e86dcc060')
