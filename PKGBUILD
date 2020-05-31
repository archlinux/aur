# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash
pkgver=2.50
pkgrel=1
pkgdesc='Yet Another SHell is a POSIX-compliant command line shell'
arch=('x86_64' 'armv7h')
url='http://sourceforge.jp/projects/yash/'
license=('GPL')
depends=('ncurses')
install="${pkgname}.install"
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}.install")
sha256sums=('b6e0e2e607ab449947178da227fa739db4b13c8af9dfe8116b834964b980e24b'
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
