# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=sx
pkgver=2.1.6
pkgrel=1
pkgdesc="Simple alternative to startx(1) for starting an Xorg server."
arch=('any')
url="https://github.com/Earnestly/sx"
license=('MIT')
depends=('xorg-server' 'xorg-xauth')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('85a3112cd9b25880685ce093da322e84f52534145e8b8db54551bd8964e3e66d')
b2sums=('916db7873c7bc331dac5c4883caea48dd7b1fb7c51e5795ddcff90e113dec30955e3c4917072c2c445d7ded64b2dd1bbe05b373c71471ff03aab7b26c802b239')

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
