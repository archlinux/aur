# Maintainer: John Lane <archlinux at jelmail dot com>

pkgname=libafsplit
pkgver=0.1
pkgrel=1
pkgdesc="Anti-forensic Information Splitter"
arch=('i686' 'x86_64')
license=('GPL')
url="http://clemens.endorphin.org/AFsplitter"
source=("http://clemens.endorphin.org/AFsplitter-${pkgver}.tar.bz2"
        'https://raw.githubusercontent.com/johnlane/libafsplit/master/Makefile')
sha1sums=('baf2857b3c87f369a36a67bb8603a6c417eba43e'
          'dcfe9592539e8b28623766adbda1fffbffc0b96a')

build() {
   cd "${srcdir}/AFsplitter-${pkgver}"
   make -f "${srcdir}/Makefile"
}

package() {
   cd "${srcdir}/AFsplitter-${pkgver}"
   install -D -m644 libafsplit.so "${pkgdir}/usr/lib/libafsplit.so"
}
