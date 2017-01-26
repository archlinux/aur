# Maintainer: SoniEx2 <endermoneymod at gmail dot com>
pkgname=lit
pkgver=3.5.2
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
sha256sums=('d4ffc525dea6d60d4a226767870e8990bf4efaabc300e7cf38481716efd9b653'
            'c152cdc2d87b031302234b5b6b6047d34017119354fee312a81bb349989fbe7b')

build() {
  cd "$srcdir"

  luvi "lit-$pkgver.zip" -- make "lit-$pkgver.zip" ./lit ./fakeluvi
}

package() {
  cd "$srcdir"

  install -Dm755 lit "$pkgdir/usr/bin/lit"
}
