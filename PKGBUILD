# Contributor: Hubert Dej <hubert.dej@student.uj.edu.pl>
# Contributor: Katzper Michno  <katzper.michno@student.uj.edu.pl>
# Contributor: Maciej Matys <maciej.matys@student.uj.edu.pl>
# Contributor: Tomasz Mazur <tomasz.mazur@student.uj.edu.pl>
#
# Maintainer: Michał Pajda <m.pajda@student.uj.edu.pl>
# Maintainer: Michał Horodecki <michal.horodecki@student.uj.edu.pl>
# Maintainer: Dominik Matuszek <dominik.matuszek@student.uj.edu.pl>
# Maintainer: Kacper Topolski <kacper.topolski@student.uj.edu.pl>
pkgname=anteater
pkgver=0.0.0
pkgrel=1
pkgdesc="Tool for tracing program output and creating structured logs using plain text or html."
arch=('x86_64')
url="https://github.com/Student-Team-Projects/Debugger.git"
license=('GPL-3.0-or-later')
depends=('libbpf' 'bpf' 'boost')
makedepends=('make' 'clang')
source=("debugger-2.0.0.zip::https://github.com/Student-Team-Projects/debugger/archive/refs/tags/v2.0.0.zip")
md5sums=("SKIP")
noextract=()

build() {
    cd "debugger-2.0.0"
    make build
}

package() {
    cd "debugger-2.0.0"
    mkdir -p $pkgdir/usr/bin
    cp bin/main $pkgdir/usr/bin/anteater
    chown root $pkgdir/usr/bin/anteater
    chmod 4755 $pkgdir/usr/bin/anteater
}
