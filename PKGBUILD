# Maintainer: SoniEx2 <endermoneymod at gmail dot com>
pkgname=luvit
pkgver=2.14.1
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
sha256sums=('d163880a8ef8e6db17179d6c5529d5bb1cad14d7c1a2aefd23758210467759b7'
            'c152cdc2d87b031302234b5b6b6047d34017119354fee312a81bb349989fbe7b')

build() {
  cd "$srcdir"

  lit make "luvit-$pkgver.zip" ./luvit ./fakeluvi
}

package() {
  cd "$srcdir"

  install -Dm755 luvit "$pkgdir/usr/bin/luvit"
}
