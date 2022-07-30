# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
pkgname=hodie
pkgver=1.4
pkgrel=3
pkgdesc="Prints the date in Latin."
url="http://hodie.sourceforge.net"
arch=('i686' 'x86_64')
license=('custom')
source=(https://downloads.sourceforge.net/hodie/${pkgname}-${pkgver}.tar.gz
        Makefile.diff)

sha256sums=('ef553078f457f65068712a8ac5cf9361431f227546c30ea9396cd12c83dc4266'
            '9626b332d17127339fbba032f4a6356bd6e3a5fe70e8f8111bbc1046ad622b71')

build() {
  cd "${pkgname}-${pkgver}"
  patch -p0 -i ../Makefile.diff || return 1
  make || return 1
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
