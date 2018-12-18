# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=mpssh
pkgver=1.3.3
pkgrel=2
pkgdesc='Mass Parallel SSH'
arch=(x86_64 i686)
url='https://github.com/ndenev/mpssh'
license=('custom:BSD')
depends=('openssh')
optdepends=()
source=("${url}/archive/${pkgver}.tar.gz"
        'LICENSE')
sha1sums=('ba11dfe7607cac3d47f1c86db236a2e440700ce7'
          '298a1f1087f2483005cba2878acd17eb8c3bf94c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/mpssh" "$pkgdir/usr/bin/mpssh"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
