# Maintainer: li <lcj211@aihlp.com>

pkgname=systemd-wol
pkgver=1.0.0
pkgrel=1
pkgdesc="systemd for wol"
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
depends=(
wol

)
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
#optdepends=(
# 'pkgbuild-introspection: For mksrcinfo'
#)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=(
wol@.service
wol@.timer
)
sha512sums=(
e76d9d6ce5980446c5a6028a23b89688124854ee5145fb5e2ef954c576cda34dd7385a35864e73518566339dca344dae44f3b50bb333617055fa03e0e6f6b380
acbea5360240c8914c7a9c3244d9eb256ce6308d43f8461bf8379c358b853ea09dc3c9f48e25423d59083902d3f85f8f245ca5c9f7fa4296a4ccc569390c0748

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
install  -Dm644  wol@.service  "$pkgdir/usr/lib/systemd/system/wol@.service"
install  -Dm644  wol@.timer  "$pkgdir/usr/lib/systemd/system/wol@.timer"
install  -dm755   "$pkgdir/etc/$pkgname"

}

groups=('lcj')

