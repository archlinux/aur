# Maintainer: David Vernet <void@manifault.com>
pkgname=retsnoop
pkgver=0.9.2
pkgrel=1
pkgdesc="BPF-based tool for detecting error conditions in the kernel"
arch=('x86_64')
url="https://github.com/anakryiko/retsnoop"
license=('GPL')
groups=('linux-tools')
depends=('glibc' 'libelf' 'zlib')
makedepends=('cargo' 'clang13' 'git' 'llvm')
source=("https://github.com/anakryiko/$pkgname/releases/download/v$pkgver/srcs-full-v$pkgver.tar.gz")
sha256sums=('042fd84ebf7fb639bf3a9863869cd9dd9c439efd5920640aa83b071555c9d75b')

build() {
	make -C "${srcdir}/src"
}

package() {
	install -d "${pkgdir}/usr/bin"
	cp "${srcdir}/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
