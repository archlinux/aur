# Maintainer: SoniEx2 <endermoneymod at gmail dot com>
pkgname=luvit
pkgver=2.11.5
pkgrel=1
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
source=("luvit-$pkgver.zip::https://lit.luvit.io/packages/luvit/luvit/v$pkgver.zip" 'fakeluvi')
noextract=("luvit-$pkgver.zip")
sha256sums=('2d04ec51b84601827300e554d3477227d548b9476f62603ef7e99f322e57f959'
            'c152cdc2d87b031302234b5b6b6047d34017119354fee312a81bb349989fbe7b')

build() {
  cd "$srcdir"

  lit make "luvit-$pkgver.zip" ./luvit ./fakeluvi
}

package() {
  cd "$srcdir"

  install -Dm755 luvit "$pkgdir/usr/bin/luvit"
}
