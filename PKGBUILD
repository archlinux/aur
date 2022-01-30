# Maintainer: Fredrick Brennan <copypaste@kittens.ph>

pkgname=bdf2psf-debian
pkgver=1.207
pkgrel=2
pkgdesc='Bitmap font conversion utility with a very long history (Debian source)'
makedepends=('grep' 'libxml2' 'curl')
depends=('perl')
provides=('bdf2psf')
conflicts=('bdf2psf')
replaces=('bdf2psf')
arch=('any')
license=('GPL2')
source=("http://deb.debian.org/debian/pool/main/c/console-setup/bdf2psf_${pkgver}_all.deb")
sha512sums=('SKIP')

pkgver() {
    curl 'http://deb.debian.org/debian/pool/main/c/console-setup/?C=M;O=D' | xmllint --html --xpath '//a/text()' /dev/stdin | grep bdf2psf | grep -oP '\d+\.\d+' | head -n 1
}

package() {
    set -x
    tar -xvf data.tar.xz
    mv $srcdir/usr $pkgdir
    set +x
}
