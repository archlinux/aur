# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=shotgun
pkgver=1.1.0
pkgrel=1
pkgdesc="Minimal X screenshot utility"
arch=('x86_64')
url="https://github.com/Streetwalrus/$pkgname"
license=('MPL2')
depends=('libx11' 'libxrandr')
makedepends=('cargo')
source=("https://github.com/Streetwalrus/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('f7026866e15bce90196856a7841639d4')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo install --root ${pkgdir}/usr
  rm ${pkgdir}/usr/.crates.toml
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -d ${pkgdir}/usr/lib/udev/rules.d
}

# vim:set ts=2 sw=2 et:
