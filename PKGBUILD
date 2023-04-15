# Maintainer: Paul <pb.orzel@proton.me>
pkgname=amdgpu_top
pkgver=0.1.4
pkgrel=1
pkgdesc="Tool that shows AMD GPU utilization"
arch=("any")
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=("MIT")
depends=(
  "glibc"
  "libdrm"
)
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Umio-Yasuno/amdgpu_top/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bfe896b9abc4964ac9596883b14b1e895ee148a177511bf0f6900b3497005028')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 target/release/amdgpu_top "${pkgdir}/usr/bin/amdgpu_top"
}
