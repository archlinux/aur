# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Dominion <xGenoBlast@gmail.com>
pkgname=powder
pkgver=117
pkgrel=1
pkgdesc='A graphical roguelike, originally designed for the Game Boy Advance'
url='http://www.zincland.com/powder/'
arch=('i686' 'x86_64')
license=('custom')
depends=('sdl')
source=("$pkgname-$pkgver.tar.gz::http://zincland.com/powder/release/${pkgname}${pkgver}_src.tar.gz")
sha256sums=('070346921ee83bc40943b1e1cb576ab3222cecc319fe10f5c138a4deec85e861')

build() {
  cd "${srcdir}/${pkgname}${pkgver}_src/"
  ./buildall.sh --use-home-dir
}

package() {
  cd "${srcdir}/${pkgname}${pkgver}_src/"
  install -Dm755 powder "${pkgdir}/usr/bin/powder"
  # Add LICENSE
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/powder/LICENSE"
}
