# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash
pkgver=2.48
pkgrel=1
pkgdesc="Yet Another SHell is a POSIX-compliant command line shell"
arch=('x86_64')
url="http://sourceforge.jp/projects/yash/"
license=('GPL')
depends=('ncurses')
install=${pkgname}.install
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}.install")
sha256sums=('f46294d77c5a646405db20a6dc3d16bc1ed109b061b2a508081ce483153c1e8d'
            'c66c7a4b9da4416082ea57bbec0ce0c2bbc13af340ceb1241b4a4897d8944531')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-array \
    --enable-dirstack \
    --enable-help \
    --enable-history \
    --enable-lineedit \
    --enable-nls \
    --enable-printf \
    --enable-socket \
    --enable-test \
    --enable-ulimit
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
