# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgname=codelite-bin
pkgver=10.0.0
pkgrel=1
_pkgname=codelite
_pkgrel=1
pkgdesc="A cross platform C/C++/PHP and Node.js IDE written in C++"
arch=('i686' 'x86_64')
url="http://www.codelite.org/"
license=('GPL')
depends=('wxgtk' 'curl' 'webkitgtk2' 'libssh'
				 'xterm' 'python2' 'libedit' 'ncurses'
				 'valgrind' 'libmariadbclient' 'lldb' 'clang>=3.9.0')

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
#if [[ $CARCH == i686 ]]; then
#	md5sums=('59c43aad31c590720c39d6543eaace58')
#else
#	md5sums=('6b7bb53b436ed5de26564934c279bf89')
#fi

build() {
   cd $srcdir/
}

package() {
	find "${srcdir}/usr" -type d -exec chmod 755 '{}' \;
  cp -r "${srcdir}/usr" "${pkgdir}"
	mkdir -p "${pkgdir}/usr/lib"
#	ln -s /usr/lib/libclang.so "${pkgdir}/usr/lib/libclang.so.3.8"
}
