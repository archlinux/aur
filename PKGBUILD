# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
pkgname=cpx
pkgver=1.3.5
pkgrel=1
pkgdesc="Cargo-like CLI for C++, compatible with CMake (vcpkg), Bazel and Meson"
arch=(x86_64 aarch64)
url="https://github.com/ozacod/cpx"
license=(MIT)
depends=(cmake vcpkg bazel meson)
makedepends=(git go)
optdepends=()
options=()
source=("git+$url#tag=v$pkgver")
sha512sums=('a347c6e6e1e1f125faade3b13e2b63e49324d8fa7533323115053398f469918f9d8306ca1383e93dafe8e69a5506022ecfd26d588f5ad31a4cc4eee25fa5aa2f')

build() {
	cd $pkgname
	go build -o cpx cmd/cpx/main.go
}

package() {
	cd $pkgname
	install -Dm755 cpx -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
