# Maintainer: Clara <claracarrasquelfiorini@gmail.com>
pkgname=dcon-git
pkgver=0.1.2
pkgrel=1
pkgdesc="A program that converts decimal degrees to dms"
arch=(x86_64)
url="https://github.com/ClaraCF/dcon"
license=('MIT')
depends=()
makedepends=(cargo gcc)
provides=(dcon)
conflicts=(dcon-bin)
source=("git+$url")
md5sums=('SKIP')


build() {
	cd dcon

  cargo build --release --target-dir target
  strip --strip-all target/release/dcon
}


package() {
	cd dcon
  install -Dm755 target/release/dcon "${pkgdir}/usr/bin/dcon"
}
