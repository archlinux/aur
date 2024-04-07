# Maintainer: Philipp Schaffrath <philipp dot schaffrath at gmail dot com>

pkgname=phinger-cursors
pkgver=2.0
pkgrel=1
pkgdesc='Most likely the most over-engineered cursor theme.'
url='https://github.com/phisch/phinger-cursors'
license=('CC-BY-SA-4.0')
arch=('any')
source=("$pkgname-$pkgver.tar.bz2::${url}/releases/download/v${pkgver}/${pkgname}-variants.tar.bz2")
md5sums=('04067bd1e27bbb88ae5b548e2bcca348')
sha256sums=('035d811ad734fb00ea79218de256d47b91b73efe08b100784e4bd61e70d4e9b1')

package() {
    install -Ddm755 "$pkgdir/usr/share/icons"
    for dir in $(find . -mindepth 1 -maxdepth 1 -type d); do
        cp -dr --no-preserve=ownership "$dir" "$pkgdir/usr/share/icons/"
    done
}