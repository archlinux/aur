# Maintainer: Philipp Schaffrath <philipp dot schaffrath at gmail dot com>

pkgname=phinger-cursors
pkgver=1.0
pkgrel=1
pkgdesc='Most likely the most over-engineered cursor theme.'
url='https://github.com/phisch/phinger-cursors'
license=('CC-BY-SA-4.0')
arch=('any')
source=("${url}/releases/download/v${pkgver}/${pkgname}-variants.tar.bz2")
md5sums=('79731e8c07c8101440b5b832e2be930f')
sha256sums=('b22135f87ca51b58aada03b5710f2d1c5f66aa7fbf7fbbcc15f96184636755be')

package() {
    install -Ddm755 "$pkgdir/usr/share/icons"
    for dir in $(find . -mindepth 1 -maxdepth 1 -type d); do
        cp -dr --no-preserve=ownership "$dir" "$pkgdir/usr/share/icons/"
    done
}