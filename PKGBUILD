# Maintainer: Julien Virey <julien.virey@gmail.com>
pkgname=albert-copyq
pkgver=1.5.r0.55a0e1b
pkgrel=1
pkgdesc="Albert extension to access copyq clipboard history"
arch=('any')
url="https://github.com/BarbUk/external"
license=('GPL')
depends=('albert' 'copyq')
source=("git+https://github.com/BarbUk/external")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/external"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
    install -D "${srcdir}/external/copyq.sh" "${pkgdir}/usr/share/albert/org.albert.extension.externalextensions/extensions/copyq.sh"
}
