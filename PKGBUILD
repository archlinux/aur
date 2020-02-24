# Maintainer: Thomas Kiss <thokis@gmail.com>

pkgname=sane-airscan
pkgrel=1
pkgver=0.9.16
pkgdesc='SANE - Apple AirScan (eSCL) driver'
url='https://github.com/alexpevzner/sane-airscan'
arch=('aarch64' 'x86_64')
license=('GPL2')
depends=('sane' 'libsoup')
makedepends=('ctags' 'git')
source=("https://github.com/alexpevzner/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('526cb3b3029195cbd5e6d362950b45c045415585e2fb3f18631fa470df6ad531')

build() {
    cd ${pkgname}-${pkgver}
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
