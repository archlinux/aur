# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Dominion <xGenoBlast@gmail.com>

pkgname=powder
pkgver=117
pkgrel=1
pkgdesc="A graphical roguelike, originally designed for the Game Boy Advance"
url="http://www.zincland.com/powder/"
arch=('i686' 'x86_64')
license=('custom')
depends=('sdl')
source=("http://zincland.com/powder/release/${pkgname}${pkgver}_src.tar.gz")
md5sums=('c4f11cd0ad6b649474ed5ede84e7423b')

build() {
  cd "${srcdir}/${pkgname}${pkgver}_src/"
  ./buildall.sh --use-home-dir
}

package() {
  cd "${srcdir}/${pkgname}${pkgver}_src/"
  install -Dm 755 powder "${pkgdir}/usr/bin/powder"

  ## Copy license
  install -Dm 644 LICENSE.TXT "${pkgdir}/usr/share/licenses/powder/LICENSE.TXT"
}
