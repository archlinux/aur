# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgname=codelite-bin
pkgver=11.0.0
pkgrel=1
_pkgname=codelite
_pkgrel=1
pkgdesc="A cross platform C/C++/PHP and Node.js IDE written in C++"
arch=('x86_64')
url="http://www.codelite.org/"
license=('GPL')
depends=('wxgtk3'
          'webkit2gtk' 'ffmpeg' 'libx264'
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
install=codelite.install
replaces=('codelite' 'codelite-svn')
provides=('codelite')

source=("http://download.opensuse.org/repositories/home:/zeph33:/archlinux/Arch_Extra/${CARCH}/${_pkgname}-${pkgver}-${_pkgrel}-${CARCH}.pkg.tar.xz")
md5sums=('SKIP')

build() {
   cd $srcdir/
}

package() {
	find "${srcdir}/usr" -type d -exec chmod 755 '{}' \;
  cp -r "${srcdir}/usr" "${pkgdir}"
	mkdir -p "${pkgdir}/usr/lib"
#	ln -s /usr/lib/libclang.so "${pkgdir}/usr/lib/libclang.so.3.8"
}
