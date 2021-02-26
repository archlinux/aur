# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=pipe-rename
pkgver=1.1.6
pkgrel=1
pkgdesc='Rename your files using your favorite text editor'
url='https://github.com/marcusbuffett/pipe-rename'
arch=('x86_64' 'i686')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marcusbuffett/pipe-rename/archive/${pkgver}.tar.gz")
sha256sums=('bdcfe33305a3535d377cf4183853515659cc0e91b5ebb1edee8f950303b529fe')
b2sums=('4fed845c0a59e1e01edf17f76008befc0df2173c6a88f7e54a291f8293f5cace9d5a8b9ee331e248e6a6d97e0dd0f7434599dc51ff5ff3539f5301ee3bd1a065')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0755 target/release/renamer "${pkgdir}/usr/bin/pipe-rename"
}
