pkgname=xdvdfs
pkgver=0.5.0.rc1
_pkgver=0.5.0-rc1
pkgrel=1
pkgdesc="A collection of tools for interacting with XDVDFS/XISO images."
arch=(x86_64)
url="https://github.com/antangelo/xdvdfs"
license=('MIT')
depends=('gcc-libs')
options=('!lto')
makedepends=('rust')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/antangelo/${pkgname}/archive/v${_pkgver}.tar.gz")
sha256sums=('a9ba17382086b495a4128c066bc22178963a9ddd4b24230e8e0bb4cbf3e4f9a4')

build() {
  cd "$pkgname-$_pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$_pkgver"

  install -Dm755 target/release/xdvdfs "$pkgdir/usr/bin/xdvdfs"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
