# Contributor: Marcin Wykpis   <marcin.wykpis@student.uj.edu.pl>
# Contributor: Adam Szwaja     <adam.szwaja@student.uj.edu.pl>
# Contributor: Piotr Kubicki   <p.kubicki@student.uj.edu.pl>
# Contributor: Szymon Szulc    <szymon.szulc@student.uj.edu.pl>
# Contributor: Krzysztof Socha <krzysztof.socha@student.uj.edu.pl>
# 
# Maintainer: studentteamprojects <TCS at Jagiellonian University> 
pkgname='bash-debugger'
pkgver=v0.0.1_alpha
pkgrel=1
pkgdesc="A lightweight and efficient debugging tool designed for Bash scripts."
arch=('x86_64')
url="https://github.com/Student-Team-Projects/Debugger"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'make' 'gcc>=4.8')
source=("git+ssh://git@github.com/Student-Team-Projects/Debugger.git")
sha256sums=('SKIP')

build() {
	cd "Debugger"
	git checkout tags/"${pkgver//_/-}"
	make
}

package() {
	cd "Debugger"
	install -Dm755 ./bin/debugger "$pkgdir/usr/bin/debugger"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/debugger"
}
