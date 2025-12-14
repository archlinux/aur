# maintainer:  harri pehkonen <harry.pehkonen+aur@gmail.com>
pkgname=codebundler
pkgver=1.0.0
pkgrel=1
pkgdesc="Bundle Git-tracked files into a single text file with checksums"
arch=('x86_64')
url="https://github.com/HarryPehkonen/CodeBundler"
license=('Unlicense')
depends=('git')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HarryPehkonen/CodeBundler/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0d3fc57a1576cd6bfc7b76403d9877f48b3de7b4c3fcbdacc98ee4f68cf3df4c')
build() {
	cmake -S "CodeBundler-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCODEBUNDLER_ENABLE_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
