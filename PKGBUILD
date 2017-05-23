# Maintainer: SoniEx2 <endermoneymod at gmail dot com>
pkgname=lit
pkgver=3.5.4
pkgrel=1
pkgdesc="Toolkit for developing, sharing, and running luvit/lua programs and libraries."
arch=(any)
url="https://github.com/luvit/lit"
license=('Apache')
groups=()
depends=('luvi')
makedepends=('luvi')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("lit-$pkgver.zip::https://lit.luvit.io/packages/luvit/lit/v$pkgver.zip" 'fakeluvi')
noextract=("lit-$pkgver.zip")
sha256sums=('2cdf1cb050220d465d5e0e0604e6769f8c907764ea86a6ddc2fc805920b09048'
            'c152cdc2d87b031302234b5b6b6047d34017119354fee312a81bb349989fbe7b')

build() {
  cd "$srcdir"

  luvi "lit-$pkgver.zip" -- make "lit-$pkgver.zip" ./lit ./fakeluvi
}

package() {
  cd "$srcdir"

  install -Dm755 lit "$pkgdir/usr/bin/lit"
}
