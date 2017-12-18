# Maintainer: Nathaniel Maia <natemaia10@gmail.com>
# Contributor: Marcus Shaetzle
# Contributor: Eric Vidal <eric@obarun.org>

pkgname=kickshaw
pkgver=0.5.4
pkgrel=1
pkgdesc='A menu editor for openbox'
url='https://github.com/natemaia/kickshaw'
arch=('x86_64')
sha256sums=('3486220da9b398dedcad0a061f6c0c46590ab2076586c6138a9a3ea5846e248f')
license=('GPL2')
source=("$url/raw/master/kickshaw_${pkgver}_source_only.tar.bz2")
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
  install -Dm644 README.md "${pkgdir}/usr/share/licenses/kickshaw/README.md"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/kickshaw/COPYING"
}
