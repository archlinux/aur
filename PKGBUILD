# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Stunts <f.pinamartins@gmail.com>
# Contributor: LoneWolf <lonewolf@xs4all.nl> 
pkgname=staden
pkgver=2.0.0b11
_pkgname=$pkgname-$pkgver-2016-src
pkgrel=1
pkgdesc="Tools for DNA sequence assembly (Gap4/5), editing and analysis (Spin)"
arch=('i686' 'x86_64')
url="http://staden.sourceforge.net/"
license=('BSD')
depends=('staden-io_lib' 'tklib')
optdepends=('iwidgets: gap5 prefinish' 'xz: better gap5 compression' 
'libpng: gap5 Report Mutations')
source=(http://downloads.sourceforge.net/staden/$_pkgname.tar.gz)
options=('!emptydirs')
md5sums=('ae59565ded12242c4c2728fbf2e185a7')

build() {
    cd $_pkgname
    ./configure --prefix=/usr --with-tklib=/usr/lib/tklib0.6
    make
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir" install
}
