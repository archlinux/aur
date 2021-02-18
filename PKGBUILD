# Contributor: agvares <omen13@bk.ru>
# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>
pkgname=codelite-bin
pkgver=15.0
pkgrel=1
_pkgname=codelite
_pkgrel=2
pkgdesc="A cross platform C/C++/PHP and Node.js IDE written in C++"
arch=('x86_64')
url="http://www.codelite.org/"
license=('GPL')
depends=('wxgtk3' 'wxgtk2' 'webkit2gtk'
          'clang' 'lldb'
          'libedit' 
          'libssh'
          'libmariadbclient'
          'ncurses'
          'xterm' 'curl'
          'python2'
          'hunspell'
		  'uchardet'
        )
makedepends=('tar' 'lz4')
optdepends=( 'graphviz: callgraph visualization'
			 'clang: compiler'
             'gcc: compiler'
             'gdb: debugger'
             'valgrind: debugger'
             'php: php IDE capabilities'
             'nodejs: for Node.js IDE'
            )

_ext="zst"
_decomp="zstdmt"
replaces=('codelite' 'codelite-svn')
conflicts=('codelite' 'codelite-git')
provides=('codelite')
source=("https://mirror.lesviallon.fr/aviallon/x86_64/${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.${_ext}")
#source=("https://www.lesviallon.fr/download/packages/${CARCH}/${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.xz")
sha256sums=('e6ee2ba8b3ea7f0581ca005791065db3774dfd345bbeba2614b49cd33f0b5ef1')
noextract=(${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.${_ext})

package() {
  tar -I ${_decomp} -xvf "${srcdir}/${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.${_ext}" -C "${pkgdir}"
  rm -f "${pkgdir}/.BUILDINFO"
  rm -f "${pkgdir}/.MTREE"
  rm -f "${pkgdir}/.PKGINFO"
# 	find "${pkgdir}/usr/bin" -type d -exec chmod 755 '{}' \;
}
