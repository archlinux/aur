# Maintainer: Rasmus Steinke <rasi at xssn dot at>
# Revived from: Vincent Berset <msieurhappy@gmail.com>

pkgname=mpd-sima
pkgver=0.13.1
pkgrel=2
pkgdesc="Automagically add title to mpd playlist based on last.fm recomendations"
arch=('any')
url="http://codingteam.net/project/sima"
license=('GPL')
depends=('python' 'python-musicpd')
makedepends=('make')
source=("http://codingteam.net/project/sima/download/file/mpd_sima-$pkgver.tar.xz")
md5sums=('75c21858d5a220438dca794dcc0822da')

build() {
    cd "$srcdir/MPD_sima-${pkgver}"

    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' \
        mpd-sima simadb_cli
}

package() {
    cd "${srcdir}/MPD_sima-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

