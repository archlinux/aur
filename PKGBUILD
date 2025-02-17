# Contributor: Marcin Wykpis   <marcin.wykpis@student.uj.edu.pl>
# Contributor: Adam Szwaja     <adam.szwaja@student.uj.edu.pl>
# Contributor: Piotr Kubicki   <p.kubicki@student.uj.edu.pl>
# Contributor: Szymon Szulc    <szymon.szulc@student.uj.edu.pl>
# Contributor: Krzysztof Socha <krzysztof.socha@student.uj.edu.pl> 
# Maintainer: studentteamprojects <TCS at Jagiellonian University> 
pkgname='bash-debugger'
pkgver='0.0.1_alpha'
pkgrel=1
pkgdesc="A lightweight and efficient debugging tool designed for Bash scripts."
arch=('x86_64')
url="https://github.com/Student-Team-Projects/Debugger"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'make' 'gcc>=4.8')
source=("Debugger-${pkgver//_/-}.zip::https://github.com/Student-Team-Projects/Debugger/archive/refs/tags/v${pkgver//_/-}.zip")
sha256sums=('SKIP')

build() {
	cd "$srcdir/Debugger-${pkgver//_/-}"
	make
}

package() {
	cd "$srcdir/Debugger-${pkgver//_/-}"
	install -Dm755 ./bin/debugger "$pkgdir/usr/bin/debugger"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/debugger"
}
