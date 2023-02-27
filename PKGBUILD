# Maintainer: David Vernet <void@manifault.com>
pkgname=retsnoop
pkgver=0.9.5
pkgrel=1
pkgdesc="BPF-based tool for detecting error conditions in the kernel"
arch=('x86_64')
url="https://github.com/anakryiko/retsnoop"
license=('GPL')
groups=('linux-tools')
depends=('glibc' 'libelf' 'zlib')
makedepends=('cargo' 'clang13' 'git' 'llvm')
source=("https://github.com/anakryiko/$pkgname/releases/download/v$pkgver/srcs-full-v$pkgver.tar.gz")
sha256sums=('80c831fdd5f4d8c406057b58476701b0b15308316afb1b671b5d13a56657c485')

build() {
	make -C "${srcdir}/src"
}

package() {
	install -d "${pkgdir}/usr/bin"
	cp "${srcdir}/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
