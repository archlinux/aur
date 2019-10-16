# Contributor: agvares <omen13@bk.ru>
# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>
pkgname=codelite-bin
pkgver=13.0
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
          'hunspell'
        )
makedepends=('tar' 'xz')
optdepends=( 'graphviz: callgraph visualization'
				     'clang: compiler'
             'gcc: compiler'
             'gdb: debugger'
             'valgrind: debugger'
             'php: php IDE capabilities'
             'nodejs: for Node.js IDE'
            )

replaces=('codelite' 'codelite-svn')
conflicts=('codelite' 'codelite-git')
provides=('codelite')

source=("https://www.lesviallon.fr/download/packages/${CARCH}/${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.xz")
sha1sum=('baa8291ad50b7827c373cca0396f666c')
noextract=(${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.xz)

package() {
  tar xf "${srcdir}/${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.xz" -C "${pkgdir}"
  rm -f "${pkgdir}/.BUILDINFO"
  rm -f "${pkgdir}/.MTREE"
  rm -f "${pkgdir}/.PKGINFO"
# 	find "${pkgdir}/usr/bin" -type d -exec chmod 755 '{}' \;
}
md5sums=('baa8291ad50b7827c373cca0396f666c')
