# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash
pkgver=2.51
pkgrel=1
pkgdesc='Yet Another SHell is a POSIX-compliant command line shell'
arch=('x86_64' 'armv7h')
url='http://sourceforge.jp/projects/yash/'
license=('GPL')
depends=('ncurses')
install="${pkgname}.install"
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}.install")
sha256sums=('6f15e68eeb63fd42e91c3ce75eccf325f2c938fa1dc248e7213af37c043aeaf8'
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
