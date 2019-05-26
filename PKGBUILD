# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Wojciech Ochmański <wojciech.ochmanski@gmail.com>
# Contributor: Fredrik Strandin <fredrik@strandin.name>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=pkgcacheclean
pkgver=1.9.0
pkgrel=3
pkgdesc='Application to clean the pacman package cache'
arch=('x86_64')
url='https://github.com/dbermond/pkgcacheclean/'
license=('GPL')
depends=('pacman>=5')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/dbermond/pkgcacheclean/archive/v${pkgver}.tar.gz"
        "https://github.com/dbermond/pkgcacheclean/releases/download/v${pkgver}/pkgcacheclean-${pkgver}.tar.gz.asc")
sha256sums=('0efa1183ad556d26f5d7dbb8f34b8f6b0a6fdf0060f345e320db53b8804424e5'
            'SKIP')
validpgpkeys=('3FFA6AB7B69AAE6CCA263DDE019A7474297D8577') # Daniel Bermond

build()
{
    cd "${pkgname}-${pkgver}"
    
    make
}

package()
{
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" PREFIX='/usr' install
}
