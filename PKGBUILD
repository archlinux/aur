# Maintainer: Nathaniel Maia <natemaia10@gmail.com>
# Contributor: Marcus Shaetzle
# Contributor: Eric Vidal <eric@obarun.org>

pkgname=kickshaw
pkgver=0.5.11
pkgrel=1
pkgdesc='A menu editor for openbox'
url='https://github.com/natemaia/kickshaw'
arch=('x86_64')
sha256sums=('bb89917a63d017bdb6006ded2d6cc16e16163b3a86a64e2861de7b00aa7140ae')
license=('GPL2')
source=("$url/raw/master/source.tar.gz")
makedepends=('gtk3' 'gcc')
depends=('gtk3')

build() {
  cd source/
  make
}

package() {
  cd source/
  install -Dm755 kickshaw "$pkgdir/usr/bin/kickshaw"
  install -Dm644 kickshaw.desktop "$pkgdir/usr/share/applications/kickshaw.desktop"

  # license , copying readme in license directory for provide author
  cd ../
  install -Dm644 README.md "${pkgdir}/usr/share/licenses/kickshaw/README.md"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/kickshaw/COPYING"
}
