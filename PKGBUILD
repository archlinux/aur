# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Ivan Smolyakov <smol.ivan97@gmail.com>

pkgname=mcron
pkgver=1.2.1
pkgrel=1
pkgdesc="This is a tool to run jobs at scheduled times. It is a complete replacement for Vixie cron."
url="https://www.gnu.org/software/mcron/"
arch=('x86_64')
license=("GPL3")
depends=("guile")
makedepends=()
provides=("cron")
conflicts=("cron") 
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/mcron/${pkgname}-${pkgver}.tar.gz")
md5sums=('6fa2659cb026502e6be800a29214662b')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix "${pkgdir}/usr" --sbindir "${pkgdir}/usr/bin"
  make
 
}

package() {
  cd "$pkgname-$pkgver"

  make install

}
