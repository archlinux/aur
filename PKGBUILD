# Maintainer: truemedian <truemedian at gmail dot com>
# Contributor: SoniEx2 <endermoneymod at gmail dot com>
pkgname=lit
pkgver=3.8.5
pkgrel=1
pkgdesc="Toolkit for developing, sharing, and running luvit/lua programs and libraries."
arch=(any)
url="https://github.com/luvit/lit"
license=('Apache')
depends=('luvi')
makedepends=('luvi')
options=(!strip)
source=("lit-$pkgver.zip::https://lit.luvit.io/packages/luvit/lit/v$pkgver.zip" 
        'fakeluvi')
noextract=("lit-$pkgver.zip")
sha256sums=('SKIP'
            'c152cdc2d87b031302234b5b6b6047d34017119354fee312a81bb349989fbe7b')

build() {
  cd "$srcdir"

  luvi "lit-$pkgver.zip" -- make "lit-$pkgver.zip" ./lit ./fakeluvi
}

package() {
  cd "$srcdir"

  echo "lit has been installed as lulit"
  install -Dm755 lit "$pkgdir/usr/bin/lulit"
}
