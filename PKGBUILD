# Maintainer : ko1N <ko1N1337@gmail.com>

pkgver=0.1.1
pkgname=memflow-coredump-git
pkgrel=2
pkgdesc="Coredump connector plugin for the memflow physical memory introspection framework"
arch=(i686 x86_64)
url="https://github.com/memflow/memflow-coredump"
license=(MIT)
makedepends=(git rust cargo)
source=("git+https://github.com/memflow/memflow-coredump")
sha256sums=("SKIP")

build() {
  cd "${pkgname%-git}"
  cargo build --release --all-features
}

package() {
  cd "${pkgname%-git}/target/release"
  install -Dm755 libmemflow_coredump.so "${pkgdir}/usr/lib/memflow/coredump.so"
  install -Dm644 "../../LICENSE" "${pkgdir}/usr/share/licenses/memflow-coredump/LICENSE"
}
