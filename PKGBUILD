# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=omwcmd
pkgver=0.1.0
pkgrel=1
pkgdesc="A command line tool for interacting with openmw plugins"
provides=('omwcmd')
conflicts=('omwcmd')
arch=(any)
url="https://gitlab.com/portmod/omwcmd"
license=(GPL3)
depends=()
makedepends=("rust")
source=("https://gitlab.com/portmod/omwcmd/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('a37094e40acefd7674bf2d19fc06c06a66b2d7c54449877f776a00ec6e2e3a7878f1ae190e608775c8392a2fc67af816866925f8e5a26a5fd4eb10b9233e0756')

build() {
  cd "$pkgname-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
