# Maintainer: Thomas Kiss <thokis@gmail.com>

pkgname=sane-airscan
pkgrel=1
pkgver=0.99.4
pkgdesc='SANE - Apple AirScan (eSCL) driver'
url='https://github.com/alexpevzner/sane-airscan'
arch=('aarch64' 'x86_64')
license=('GPL2')
depends=('sane' 'libsoup')
makedepends=('ctags' 'git')
source=("https://github.com/alexpevzner/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1e86482b1620dae36d8852c4826ae5469dcab4ce8cfd67d014478df88a549cfd')

build() {
    cd ${pkgname}-${pkgver}
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
