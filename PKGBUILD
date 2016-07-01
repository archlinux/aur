pkgname=sat-shell
pkgver=1.1
pkgrel=4
pkgdesc="sat-shell is an interactive tcl-shell for solving satisfiability problems"
url="https://github.com/TestudoAquatilis/sat-shell"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('tclln' 'glib2' 'zlib' 'minisat')
optdepends=()
makedepends=('git' 'gcc' 'make' 'flex' 'bison' 'sed')
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("git+https://github.com/TestudoAquatilis/sat-shell.git")
md5sums=('SKIP')

build () {
  cd "${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 sat-shell "${pkgdir}/usr/bin/sat-shell"
  install -Dm644 -t "${pkgdir}/usr/share/sat-shell/examples" examples/*
}

# vim:set ts=2 sw=2 et:
