# Maintainer: David Vernet <void@manifault.com>
pkgname=retsnoop
pkgver=0.9.3
pkgrel=1
pkgdesc="BPF-based tool for detecting error conditions in the kernel"
arch=('x86_64')
url="https://github.com/anakryiko/retsnoop"
license=('GPL')
groups=('linux-tools')
depends=('glibc' 'libelf' 'zlib')
makedepends=('cargo' 'clang13' 'git' 'llvm')
source=("https://github.com/anakryiko/$pkgname/releases/download/v$pkgver/srcs-full-v$pkgver.tar.gz")
sha256sums=('982307041a6b3dc1c26d2e85182b7f6991cb03deb7eda6a8721e6c6bd5f56bc2')

build() {
	make -C "${srcdir}/src"
}

package() {
	install -d "${pkgdir}/usr/bin"
	cp "${srcdir}/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
