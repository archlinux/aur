# Maintainer: Isaak Eriksson <isaak.eriksson@protonmail.com>

pkgname=mongocli-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="mongocli binary to deploy and manage Atlas clusters"
arch=("x86_64")
url="https://docs.mongodb.com/mongocli/master/"
license=("SSPLv1")
provides=("mongocli=$pkgver")
source=("https://github.com//mongodb/mongocli/releases/download/v${pkgver}/mongocli_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('bb745cd35cd96567e25db9eea6033512e67cc0a4e70fe54e88c73bc01cde4142')

prepare() {
  cd "${srcdir}"
  tar -xvf "mongocli_${pkgver}_linux_x86_64.tar.gz"
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/mongocli_${pkgver}_linux_x86_64/mongocli" "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/mongocli_${pkgver}_linux_x86_64/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set tabstop=4 shiftwidth=2 expandtab:
