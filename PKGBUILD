# Maintainer: David Holland <info (at) dustvoice.de>

# You have to
#  login to https://backstage.renoise.com
#  download your copy
#  place it into same DIR as this file

pkgname="renoise-redux"
pkgver="1.3.2"
pkgrel="1"
pkgdesc="A sampler VST plugin from Renoise"
arch=("x86_64")
url="https://www.renoise.com/products/redux"
license=("custom:redux")
depends=()
optdepends=()
makedepends=()
options=("!strip")
conflicts=("renoise-redux-beta")

source=("file://rns_rdx_${pkgver//./}_linux_${arch}.tar.gz")
md5sums=('75aa11f3ecf6fb7b867821f6a0479377')

prepare() {
    bsdtar xf "$srcdir/rns_rdx_${pkgver//./}_linux_${arch}.tar.gz"
}

package() {
    cd "$srcdir/rns_rdx_${pkgver//./}_linux_${arch}/renoise_redux_${arch}"

    mkdir -p "$pkgdir/usr/lib/vst/renoise-redux.vst"
    cp -r "renoise_redux.so" "renoise_redux.res" "$pkgdir/usr/lib/vst/renoise-redux.vst"
    chmod -R 755 "$pkgdir/usr/lib/vst/renoise-redux.vst"

    cd "$srcdir/rns_rdx_${pkgver//./}_linux_${arch}"
}
