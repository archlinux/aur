# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=sx
pkgver=2.1.7
pkgrel=2
pkgdesc="Simple alternative to startx(1) for starting an Xorg server."
arch=('any')
url="https://github.com/Earnestly/sx"
license=('MIT')
depends=('xorg-server' 'xorg-xauth')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('81f680ac0728e10896987e18a7661dc474d90c09afff25c9795e748899085823')
b2sums=('1f7989ca1b942cd46e9976a38e7fb4080cba60c47e9e184afd1ee7bd2b3cb42221d9f98113f2b9eb60968c8cfbbe1a7f0ebf4c7d1a6033a274aad11b004c64ac')

package() {
    cd ${pkgname}-${pkgver}

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
