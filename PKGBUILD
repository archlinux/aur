# Maintainer: li <lcj211@aihlp.com>

pkgname=firewalld-service
pkgver=1.0.0
pkgrel=2
pkgdesc="All tools for Lcj"
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
depends=(
firewalld

)
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
optdepends=(
	'pkgbuild-introspection: For mksrcinfo'


)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=(
  broadcast-udp.xml
        multicast-igmp.xml
        multicast-udp.xml
        unifi.xml
)
sha512sums=('9dcac73926206ae46b058f5873894d64fc25f260ee63d7b8348ecd7deeb3fe9878bc3dc92982f03c58243e867a00d8883bf4662bf4b8d26c3f667aee5217bd12'
            'c9ed8c9008456d5a64bd7acf1342bf984845b4d366bf47e776d7be9450237a68b0284219a5803edc73b65588ed25d975ca6c76a1fe09ace1fe0f6822f20dbc14'
            '92da0b53c82c89a9070065b677b88d9d82a513d5cce43a623983bd7a807582acfa441149599bdb295984c414c5ea2420897f91f4b8bc2412ff005e2a90d856d8'
            '9efbc18099936132ffbe21971b71f775d36d0a95d69a97ce9f01c21a6ac8d01b75d5ffd567d4085621950253d3836afc27ec73396b4911d26ce46aa698b006ae')



#Package files should follow these general directory guidelines:
#/etc	System-essential configuration files
#/usr/bin	Binaries
#/usr/lib	Libraries
#/usr/include	Header files
#/usr/lib/{pkg}	Modules, plugins, etc.
#/usr/share/doc/{pkg}	Application documentation
#/usr/share/info	GNU Info system files
#/usr/share/man	Manpages
#/usr/share/{pkg}	Application data
#/var/lib/{pkg}	Persistent application storage
#/etc/{pkg}	Configuration files for {pkg}
#/opt/{pkg}	Large self-contained packages


#build() {
 # rm -rf build
 # cmake -B build -S "$pkgname-v$pkgver" \
 # -DCMAKE_INSTALL_PREFIX=/usr \
 # -DBUILD_TESTING=OFF \
 # -Wno-dev
 # make -C build:

#}

package() {
# make -C build DESTDIR="$pkgdir" install
install  -Dm644  broadcast-udp.xml  "$pkgdir/usr/lib/firewalld/services/broadcast-udp.xml"
install  -Dm644  multicast-igmp.xml  "$pkgdir/usr/lib/firewalld/services/multicast-igmp.xml"
install  -Dm644  multicast-udp.xml  "$pkgdir/usr/lib/firewalld/services/multicast-udp.xml"
install  -Dm644  unifi.xml  "$pkgdir/usr/lib/firewalld/services/unifi.xml"

}

groups=('lcj')

