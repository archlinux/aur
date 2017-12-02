# Maintainer: Archimede Pitagorico <archimede.pitagorico@mail.com>

pkgname=revinetd
pkgver=v1.0.2.0.gf81f000
pkgrel=1
pkgdesc="revinetd, tcp reverse tunnel (TCP change of gender)"
arch=('x86_64')
url='http://revinetd.sourceforge.net'
license=('GPLv2')
source=('git+https://github.com/archimedepitagorico/revinetd.git#tag=v1.0.2'
        )
#install=$pkgname.install

makedepends=('git'
             )
sha1sums=('SKIP'
	)
options=('!buildflags'
        )

pkgver() {
  cd revinetd
  echo "$(git describe --long --tags | tr - . | tr _ .)"
}

prepare() {
  cd revinetd
  ./configure
}

build() {
    cd revinetd
    make
}

package() {
   cd revinetd
   mkdir -p ${pkgdir}/usr/bin
   cp revinetd ${pkgdir}/usr/bin/revinetd
}
