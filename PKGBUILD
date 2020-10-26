pkgname=controls
pkgver=1.0
pkgrel=1
pkgdesc="Data and passwords manager"
arch=('any')
url="https://gitlab.com/alexvim/controls"
license=('GPLv3')
makedepends=('cmake')
depends=(
    'zip'
    'unzip'
)
source=("https://gitlab.com/alexvim/controls/-/raw/master/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
md5sums=('dd65ea7148c7000b08a272c3c9b41cc4')
build() {
        cd ${srcdir}
        cmake CMakeLists.txt
    	make
}
package() {
    	cd ${srcdir}
        mkdir -p "${pkgdir}/usr/bin/"
        install -Dm755 controls "${pkgdir}/usr/bin/"
}
