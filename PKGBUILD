# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.5.1
pkgrel=1
pkgdesc="Profiles for building Arch Linux Live ISO images. Featuring persistence, encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('syslinux')
optdepends=('devtools: ZFS building option'
            'pacman-contrib: ZFS building option')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('7c7af707688f4fe3fc9b91ecda76bd278d950b76b4f40aedad637db91e6106c6'
            'SKIP')
b2sums=('1327b5bf25269a598304c0b60dc15dfdab6d9937876afd0d258db82476808cca4b6f782adae8886778e0ee548a48376d56f1c53f634bc69ec28512e1849a6fd4'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
