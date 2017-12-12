# Maintainer: Nathaniel Maia <natemaia10@gmail.com>
# Contributor: Marcus Shaetzle
# Contributor: Eric Vidal <eric@obarun.org>

pkgname=kickshaw
pkgver=0.5.2
pkgrel=1
pkgdesc='A menu editor for openbox'
url='https://github.com/natemaia/kickshaw'
arch=('x86_64')
sha256sums=('1a7481138abcf36d74d1254edd027c96014c937d18543e862804eb7a2574979f')
license=('GPL2')
source=("$url/raw/master/kickshaw_0.5.2_source_only.tar.bz2")
makedepends=('gtk3' 'gcc')
depends=('gtk3')

build() {
  cd source/
  make
}

package() {
  cd source/
  install -Dm755 kickshaw "$pkgdir/usr/bin/kickshaw"
  install -Dm755 kickshaw.desktop "$pkgdir/usr/share/applications/kickshaw.desktop"

  # license , copying readme in license directory for provide author
  cd ../
  install -Dm755 README.md "${pkgdir}/usr/share/licenses/kickshaw/README.md"
  install -Dm755 COPYING "${pkgdir}/usr/share/licenses/kickshaw/COPYING"
}
