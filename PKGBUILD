# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=shotgun
pkgver=1.1.4
pkgrel=1
pkgdesc="Minimal X screenshot utility"
arch=('x86_64')
url="https://github.com/Streetwalrus/$pkgname"
license=('MPL2')
depends=('libx11' 'libxrandr')
makedepends=('cargo')
source=("https://github.com/Streetwalrus/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('6b4ef302a93052ef24e3a818e913a377')

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
