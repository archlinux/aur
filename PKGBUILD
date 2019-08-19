# Maintainer: Amr Hassan <amr.hassan@gmail.com>
pkgname=pyoxidizer
_name=PyOxidizer
pkgver=0.3.0
pkgrel=2
pkgdesc="A modern Python application packaging and distribution tool"
arch=(x86_64)
url="https://github.com/indygreg/PyOxidizer"
license=('MIT')
source=("https://github.com/indygreg/$_name/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('a0cb51216b49340dd808f095e67a03d7')
makedepends=(cargo)

build() {
   cd "$_name-$pkgver"
   cargo build --bin pyoxidizer --release --locked
}

check() {
   cd "$_name-$pkgver"
   cargo test --bin pyoxidizer --release --locked
}

package() {
   cd "$_name-$pkgver"
   install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
