# Maintainer: li <lcj211@aihlp.com>

pkgname=systemd-kexec
pkgver=1.0.1
pkgrel=10
pkgdesc="systemd for kexec"
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
depends=('kexec-tools')
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
#optdepends=(
#	'vulkan-tools: For vulkaninfo'
#	'mesa-demos: For glxinfo',
#	'util-linux: For lscpu'
#)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=("kexec@.service"
systemctl-restart-mainline
systemctl-restart-lts
systemctl-restart-zen
systemctl-restart
)
sha512sums=('cde894488d4587b7b0272956dedfdd7684c4fe423726e008f6217eb59a5d5dfbb5289dabde5a354ab7b612c4b5b25ce2c397e632a6c4acc7f77c6d2b8fe7bdf4'
fdd87b9f186f02e0be42798663a4ae4eb47c5e9b07cbe9ef1be221a2cb271babc96429656490c786c32f9c4c2cb5a6909ef3210c70081153144a09477db719ab
a8a5a09de87cc8ffe336690d8a7139d25b9deb476cdb778fd507415ccc9ac231aba20557aa260690090fa8ae17decb224f806cecd98a8a298ef2d800bc092f22
1652a8a4085bc60da9725b5b1f53464b2fe3482357b346903ed1aef64349ad9bee385932191dee8e7497e1c11c9b32a4e5ac12a010c1ac763a816b603bf690ec
a9e70074948e4ec06e02a65e01d320fc7196639345e6dad954182c9a1ccb948f340ef5d2b29571b6a6327d9375aeac9254ee6d6fecd013ad50c7ccd0791d046e


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
 # make -C build

#}

package() {
# make -C build DESTDIR="$pkgdir" install
install  -Dm644 kexec@.service  "$pkgdir/usr/lib/systemd/system/kexec@.service"
install  -Dm755 systemctl-restart-mainline  "$pkgdir/usr/bin/systemctl-restart-mainline"
install  -Dm755 systemctl-restart-lts  "$pkgdir/usr/bin/systemctl-restart-lts"
install  -Dm755 systemctl-restart-zen  "$pkgdir/usr/bin/systemctl-restart-zen"
install  -Dm755 systemctl-restart  "$pkgdir/usr/bin/systemctl-restart"
}

groups=('lcj')

