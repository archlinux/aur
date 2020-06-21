# Contributor: agvares <omen13@bk.ru>
# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>
pkgname=codelite-bin
pkgver=14.0
pkgrel=1
_pkgname=codelite
_pkgrel=1
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

_ext="lz4"
_decomp="lz4"
replaces=('codelite' 'codelite-svn')
conflicts=('codelite' 'codelite-git')
provides=('codelite')
source=("https://mirror.lesviallon.fr/aviallon/x86_64/${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.${_ext}")
#source=("https://www.lesviallon.fr/download/packages/${CARCH}/${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.xz")
sha256sums=('bfc2c5472ea5a45c169c93af2e2e3f17d9cf10483e620adaf0e9c66e1b3770a5')
noextract=(${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.${_ext})

package() {
  tar -I ${_decomp} -xvf "${srcdir}/${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.${_ext}" -C "${pkgdir}"
  rm -f "${pkgdir}/.BUILDINFO"
  rm -f "${pkgdir}/.MTREE"
  rm -f "${pkgdir}/.PKGINFO"
# 	find "${pkgdir}/usr/bin" -type d -exec chmod 755 '{}' \;
}
