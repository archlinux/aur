# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=sx
pkgver=2.1.3
pkgrel=1
pkgdesc="Simple alternative to startx(1) for starting an Xorg server."
arch=('any')
url="https://github.com/Earnestly/sx"
license=('MIT')
depends=('xorg-server' 'xorg-xauth')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('270059d4e20d93e93119ab6e278357b6d8225c8eb39d0284f22c0bea47cbcc83')
b2sums=('92d3ac1308261d4a9325262a44be8a7022ebf73b18058d2fd5493f8f9d0992b8bc2cc2ad77b747cf51b69f50727c6a422bd130f7805919c0d8e0c0ef2de8e8d0')

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
