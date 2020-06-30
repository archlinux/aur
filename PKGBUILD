# Maintainer: Thomas Kiss <thokis@gmail.com>

pkgname=sane-airscan
pkgrel=1
pkgver=0.99.8
pkgdesc='SANE - Apple AirScan (eSCL) driver'
url='https://github.com/alexpevzner/sane-airscan'
arch=('aarch64' 'x86_64')
license=('GPL2')
depends=('sane' 'libsoup')
makedepends=('ctags' 'git')
source=("https://github.com/alexpevzner/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('fdc80e0b248a474f151b59e7065c1ff4bb85c6fe332dceda86d43d36887ea248')

build() {
    cd ${pkgname}-${pkgver}
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
