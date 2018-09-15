# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgname=codelite-bin
pkgver=12.0
pkgrel=1
_pkgname=codelite
_pkgrel=1
pkgdesc="A cross platform C/C++/PHP and Node.js IDE written in C++"
arch=('x86_64')
url="http://www.codelite.org/"
license=('GPL')
depends=('wxgtk3' 'webkit2gtk'
          'clang' 'lldb'
          'libedit' 
          'libssh'
          'libmariadbclient'
          'ncurses'
          'xterm' 'curl'
          'python2'
        )
makedepends=('tar' 'xz')
optdepends=( 'graphviz: callgraph visualization'
				     'clang: compiler'
             'gcc: compiler'
             'gdb: debugger'
             'valgrind: debugger'
            )

replaces=('codelite' 'codelite-svn')
provides=('codelite')

source=("http://download.opensuse.org/repositories/home:/zeph33:/archlinux/Arch_Extra/${CARCH}/${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.xz")
md5sums=('SKIP')
noextract=(${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.xz)

package() {
  tar xf "${srcdir}/${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.xz" -C "${pkgdir}"
  rm -f "${pkgdir}/.BUILDINFO"
  rm -f "${pkgdir}/.MTREE"
  rm -f "${pkgdir}/.PKGINFO"
# 	find "${pkgdir}/usr/bin" -type d -exec chmod 755 '{}' \;
}
