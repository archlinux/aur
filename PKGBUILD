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
md5sums=('826c4c150be79c17e270a7498df7bbc7')
build() {
        cd ${srcdir}
        cmake CMakeLists.txt
    	make
}
package() {
    	cd ${srcdir}
        mkdir -p "${pkgdir}/usr/bin/"
        mkdir -p "~/.controls/backup/"
        mkdir -p "~/.controls/build/"
        mkdir -p "~/.controls/controls/"
        mkdir -p "~/.controls/data/"
        install -Dm755 controls "${pkgdir}/usr/bin/"
}
