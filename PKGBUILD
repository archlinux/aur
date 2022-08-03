# Maintainer: truemedian <truemedian at gmail dot com>
# Contributor: SoniEx2 <endermoneymod at gmail dot com>
pkgname=luvit
pkgver=2.18.1
pkgrel=1
pkgdesc="node.js style APIs for luvi as either a luvi app or library."
arch=(any)
url="https://github.com/luvit/luvit"
license=('Apache')
depends=('luvi')
makedepends=('lit')
options=(!strip)
source=("luvit-$pkgver.zip::https://lit.luvit.io/packages/luvit/luvit/v$pkgver.zip" 
        'fakeluvi')
noextract=("luvit-$pkgver.zip")
sha256sums=('SKIP'
            'c152cdc2d87b031302234b5b6b6047d34017119354fee312a81bb349989fbe7b')

build() {
  cd "$srcdir"

  lulit make "luvit-$pkgver.zip" ./luvit ./fakeluvi
}

package() {
  cd "$srcdir"

  install -Dm755 luvit "$pkgdir/usr/bin/luvit"
}
