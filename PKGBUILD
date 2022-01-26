# Maintainer: Philipp Schaffrath <philipp dot schaffrath at gmail dot com>

pkgname=phinger-cursors
pkgver=1.1
pkgrel=2
pkgdesc='Most likely the most over-engineered cursor theme.'
url='https://github.com/phisch/phinger-cursors'
license=('CC-BY-SA-4.0')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-variants.tar.bz2")
md5sums=('8a6b2bac363d08f51adb7231c2982a60')
sha256sums=('208fb5c7eadc8c6451541f0662457090a54734770d6812916fa0bad77f74d687')

package() {
    install -Ddm755 "$pkgdir/usr/share/icons"
    for dir in $(find . -mindepth 1 -maxdepth 1 -type d); do
        cp -dr --no-preserve=ownership "$dir" "$pkgdir/usr/share/icons/"
    done
}