# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
pkgname=dua
pkgver=2.1.3
pkgrel=1
pkgdesc="A tool to conveniently learn about the disk usage of directories, fast!"
arch=(any)
url="https://github.com/Byron/dua-cli"
license=(MIT)
depends=('ncurses')
makedepends=('rust' 'cargo')
conflicts=("${pkgname}-git")
source=("https://github.com/Byron/dua-cli/archive/v${pkgver}.tar.gz")
sha512sums=('dbdec4f13f4898574a53c5ab9f5fedf5fa3d4b2b8c05966f23bf9be953ef26af0e8bcb26872583ce3247588986003f8f7c8fb408562e47f0d33ce8fb4f2ec12f')

build() {
  cd "${srcdir}/dua-cli-${pkgver}"
  cargo build --release
}
check() {
  cd "${srcdir}/dua-cli-${pkgver}"
  cargo test --release
}
package() {
  cd "${srcdir}/dua-cli-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
