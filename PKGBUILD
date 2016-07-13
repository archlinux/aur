# Maintainer: SoniEx2 <endermoneymod at gmail dot com>
pkgname=luvit
pkgver=2.11.4
pkgrel=2
pkgdesc="node.js style APIs for luvi as either a luvi app or library."
arch=(any)
url="https://github.com/luvit/luvit"
license=('Apache')
groups=()
depends=('luvi')
makedepends=('lit')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("luvit-$pkgver.zip::https://lit.luvit.io/packages/luvit/luvit/v$pkgver.zip", 'fakeluvi')
noextract=("luvit-$pkgver.zip")
sha256sums=('83e765a4329c96e50a68fffbcf9d5e825d220afa10535706b907330cbf5f6d70'
            'c152cdc2d87b031302234b5b6b6047d34017119354fee312a81bb349989fbe7b')

build() {
  cd "$srcdir"

  lit make "luvit-$pkgver.zip" ./luvit ./fakeluvi
}

package() {
  cd "$srcdir"

  install -Dm755 luvit "$pkgdir/usr/bin/luvit"
}
