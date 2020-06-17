# Maintainer: Thomas Kiss <thokis@gmail.com>

pkgname=sane-airscan
pkgrel=1
pkgver=0.99.5
pkgdesc='SANE - Apple AirScan (eSCL) driver'
url='https://github.com/alexpevzner/sane-airscan'
arch=('aarch64' 'x86_64')
license=('GPL2')
depends=('sane' 'libsoup')
makedepends=('ctags' 'git')
source=("https://github.com/alexpevzner/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('421f9e80d2be5b03e4530dc78e15ae05fd9907f998104ecaf21ae0e3ddd971e6')

build() {
    cd ${pkgname}-${pkgver}
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
