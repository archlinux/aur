# Maintainer: li <lcj211@aihlp.com>

pkgname=systemd-autossh
pkgver=1.0.0
pkgrel=24
pkgdesc="systemd for autossh"
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
depends=(
autossh

)
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
#optdepends=(
# 'pkgbuild-introspection: For mksrcinfo'
#)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=(
autossh@.service
)
sha512sums=(
678c202ade70b92b8aede5f7377a4a1d2c982e0c507c7759178d0918d4f0261b58a775b5a138072d33c65d1e6a5ae192ef67d8fe0c6236ea37923ee0b2730b3e
)

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
install  -Dm644  autossh@.service  "$pkgdir/usr/lib/systemd/system/autossh@.service"
install  -dm755   "$pkgdir/etc/$pkgname"

}

groups=('lcj')

