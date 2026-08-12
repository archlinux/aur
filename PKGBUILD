# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=surrealkit
pkgname=surrealkit-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Schema management and migration tool for SurrealDB (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/surrealdb/surrealkit"
license=('Apache-2.0')
depends=('libgcc')
provides=("surrealkit=$pkgver")
conflicts=(surrealkit)
source_x86_64=("https://github.com/surrealdb/$_pkgname/releases/download/v$pkgver/surrealkit-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/surrealdb/$_pkgname/releases/download/v$pkgver/surrealkit-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('2165441a9b0e6246a670d9e6219b3f47acd6443afe55a5931288795ecfeb4629')
sha256sums_x86_64=('686d57daac13ea9f3c2b753d8d4ec75ddc78b8baeef8a8977bbf621109186122')
sha256sums_aarch64=('b292ce78f2dd40b3195d0c7df9f028d7d06f3fce9eb7378757a1e6185fb14636')
source=("LICENSE-v${pkgver}::${url}/raw/v${pkgver}/LICENSE")
options=('!debug')

prepare() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"

  # Install binary
  install -Dm755 surrealkit "$pkgdir/usr/bin/surrealkit"

  # Install license
  install -Dm644 LICENSE-v${pkgver} "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
