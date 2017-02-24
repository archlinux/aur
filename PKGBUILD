# Maintainer: François Garillot <francois[@]garillot.net>
# Contributor: rpodgomy

pkgname=drip-git
pkgver=20151019
pkgrel=3
pkgdesc="Drip is a launcher for the Java Virtual Machine that provides much faster startup times than the java command. The drip script is intended to be a drop-in replacement for the java command, only faster."
license=('GPL')
url='https://github.com/ninjudd/drip'
arch=('i686' 'x86_64')
provides=('drip')
conflicts=('drip')
depends=('java-runtime')
makedepends=('git')
options=(!libtool)
source=(${pkgname%-git}::git+https://github.com/ninjudd/drip.git)
md5sums=('SKIP')

build() {
        cd ${pkgname%-git}
        make all
}

package() {
        cd ${pkgname%-git}
        install -dm755 "$pkgdir/usr/bin"
        install -Dm755 "bin/drip" "bin/drip_daemon" "bin/drip_proxy" "$pkgdir/usr/bin"
}
