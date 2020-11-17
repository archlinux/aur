# Maintainer: Jack Random <jack (at) random.to>

# Contributors from demo package:
# Samæ <eeva.samæ@marvid.fr>
# Kristaps Karlsons <kristaps.karlsons@gmail.com>
# Max Pray a.k.a. Synthead <synthead@gmail.com>
# berkus <berkus@madfire.net>
# hm_b <holger@music-nerds.net>

# You have to
#  login to https://backstage.renoise.com
#  download your copy
#  place it into same DIR as this file

pkgname="renoise-redux"
pkgver="1.1.2"
pkgrel="1"
pkgdesc="A sampler VST plugin from Renoise"
arch=("x86_64")
url="https://www.renoise.com/products/redux"
license=("custom:redux")
depends=()
optdepends=()
makedepends=()
options=("!strip")
conflicts=()

source=("file://rns_rdx_${pkgver//./}_linux.tar.gz")
md5sums=('SKIP')

prepare() {
    bsdtar xf "$srcdir/rns_rdx_${pkgver//./}_linux.tar.gz"
}

package() {
    cd "$srcdir/rns_rdx_${pkgver//./}_linux"

    cd "64bit"
    mkdir -p "$pkgdir/usr/lib/vst/$pkgname.vst"
    cp -r "renoise_redux.so" "renoise_redux.res" "$pkgdir/usr/lib/vst/$pkgname.vst"
    chmod -R 755 "$pkgdir/usr/lib/vst/$pkgname.vst"

    cd "$srcdir/rns_rdx_${pkgver//./}_linux"

    cd "32bit"
    mkdir -p "$pkgdir/usr/lib32/vst/$pkgname.vst"
    cp -r "renoise_redux.so" "renoise_redux.res" "$pkgdir/usr/lib32/vst/$pkgname.vst"
    chmod -R 755 "$pkgdir/usr/lib32/vst/$pkgname.vst"
}
