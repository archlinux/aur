# Original Author: xgdgsc<xgdgsc@gmail.com>
# Maintainer: chendaniely<chendaniely@gmail.com>
# Contributor: Brenton Horne <brentonhorne77@gmail.com>

pkgname=rodeo
pkgver=2.5.2
pkgrel=4
pkgdesc="A data science IDE for Python"
url='https://www.yhat.com/products/rodeo'
arch=('x86_64')
depends=('jupyter' 'gconf')
license=('AGPL3')
install=rodeo.install
md5sums_x86_64=('e3288e7bae6ff83ec1048fc42cb509e6')
source_x86_64=("https://github.com/yhat/rodeo/releases/download/v$pkgver/rodeo_${pkgver}_amd64.deb")

build() {
    cd "${srcdir}"
    # bsdtar should be used, instead of tar, as makepkg uses it to decompress
    # archives, so it's automatically available
    bsdtar -xf data.tar.xz
}

package() {
    mv "$srcdir/usr" "$pkgdir"
    mv "$srcdir/opt" "$pkgdir"
}
