# Maintainer: Thomas Kiss <thokis@gmail.com>

pkgname=sane-airscan
pkgrel=1
pkgver=0.9.13
pkgdesc='SANE - Apple AirScan (eSCL) driver'
url='https://github.com/alexpevzner/sane-airscan'
arch=('aarch64' 'x86_64')
license=('GPL2')
depends=('sane' 'libsoup')
makedepends=('ctags' 'git')
source=("git+http://github.com/alexpevzner/sane-airscan.git#tag=${pkgver}")
sha1sums=('SKIP')

build() {
    cd $pkgname

    make
}

package() {
    cd $pkgname

    make DESTDIR="$pkgdir" install

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
