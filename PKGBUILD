# Maintainer: jackarc
pkgname=purple-battlenet-hg
_srcname=purple-battlenet
pkgver=r35.9e01c8ef9b3e
pkgrel=1
pkgdesc="A Pidgin plugin to login and send whispers to Battle.net v2 users."
arch=('i686' 'x86_64')
url="https://bitbucket.org/EionRobb/purple-battlenet/"
license=('GPL3') 
depends=('pidgin')
makedepends=('libpurple' 'glib2' 'protobuf-c' 'mercurial')
source=('purple-battlenet::hg+https://bitbucket.org/EionRobb/purple-battlenet/')
md5sums=('SKIP')

pkgver() {
 	cd $srcdir/$_srcname
 	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd $srcdir/$_srcname
    make 
}


package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="$pkgdir" install
}

