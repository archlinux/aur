# Maintainer: kpcyrd <git@rxv.cc>

pkgname=rshijack
pkgver=0.1.0
pkgrel=1
pkgdesc="rust rewrite of shijack"
url="https://github.com/kpcyrd/rshijack"
depends=('libpcap')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kpcyrd/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('70cf390ed308d0ea22478f3f7f93ee4ae16676eaec423d3534cc15a3d6dd57c7e84df3db9ca027ab5515d11387fceab11b4085e123d898089315409759547962')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
