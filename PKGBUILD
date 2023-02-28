# Maintainer: Hubert Dej <hubert.dej@student.uj.edu.pl>
# Maintainer: Katzper Michno  <katzper.michno@student.uj.edu.pl>
# Maintainer: Maciej Matys <maciej.matys@student.uj.edu.pl>
# Maintainer: Tomasz Mazur <tomasz.mazur@student.uj.edu.pl>
pkgname=debugger2
pkgver=1.0.1
pkgrel=1
pkgdesc="Tool for tracing program output and creating structured logs using plain text or html."
arch=('any')
url="https://github.com/Student-Team-Projects/Debugger.git"
license=('GPL3')
depends=('bpf' 'sysdig' 'fmt' 'llvm-libs')
makedepends=('clang' 'compiler-rt' 'llvm' 'spdlog' 'tclap')
source=("debugger-$pkgver.zip::https://github.com/Student-Team-Projects/debugger/archive/refs/tags/v$pkgver.zip")
md5sums=("SKIP")
noextract=()

build() {
	cd "debugger-$pkgver"
	make
}

package() {
	cd "debugger-$pkgver"
	make DESTDIR="$pkgdir" PKGNAME="debugger" install
}
