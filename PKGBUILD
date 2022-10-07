# Maintainer: David Vernet <void@manifault.com>
pkgname=retsnoop
pkgver=0.9.1
pkgrel=2
pkgdesc="BPF-based tool for detecting error conditions in the kernel"
arch=('x86_64')
url="https://github.com/anakryiko/retsnoop"
license=('GPL')
groups=('linux-tools')
depends=('glibc' 'libelf' 'zlib')
makedepends=('cargo' 'clang13' 'git' 'llvm')
source=("https://github.com/anakryiko/$pkgname/releases/download/v$pkgver/srcs-full-v$pkgver.tar.gz")
sha256sums=('9029b83c47b2d9eff02ba821072ee85221ee6aca6aad83fe9e680a8b4765819d')

build() {
	make -C "${srcdir}/src"
}

package() {
	install -d "${pkgdir}/usr/bin"
	cp "${srcdir}/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
