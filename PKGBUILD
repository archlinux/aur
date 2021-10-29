# Maintainer: li <lcj211@aihlp.com>

pkgname=gfwlist-route
pkgver=1.0.0
pkgrel=13
pkgdesc="gwflist ip for china . and add it to route "
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
#depends=(chnroutes-alike-git)
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
optdepends=(
#	'vulkan-tools: For vulkaninfo'
#	'mesa-demos: For glxinfo',
'chnroutes-alike-git: For chinaIP'
#	'util-linux: For lscpu'
)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=(
gfwlist-route  
gfwlist-route.service  
gfwlist-route.timer
iproutefile
route-ar  route-cn  route-cr
)


sha512sums=('313b7d562ca61cefde57f6a527d23740384a7e224938d54847d75b60354b2a415ca4d7f3b8c4ca7c47ddf8533a536237171f7e71ac328940894b806a6085096d'
            'd88ccb3dc7bd6c8de6b4b34ae3e815c57a59fa3c5a781d56a699fbd36f5aed3b92e1828ef6e73b6c22bbabedbd32e9b640f648b97a934facb16f9a28d1275d70'
            'd9c16c83f1f2aca760f70c5652f2c18442d32ade766ed67033e861b80d76df5f3147b55b1dbd1024d00b0bfdd8b37e0a6e0dab6eb8ab33b58c074b645a562a2e'
            '6acdbe76975b2047f2f8124948e4cae9b372f30574556e867f3d30fbf771db2e48ad6453e802bb03988f61b64815484deaa408ac373d9bc61963c41e5768b712'
            '6c23edb1241171765663f02bb030ee0a6513ae330b36d0192d6c7b2955f6c8b64b8a9489a3d9e1e4867480ab0915c1c04444cf7514b7602548952c855cad99dd'
            'fc4e4165fb9b23340b33c59f5e2cd4b941b6164952990a490d5a9e667fd0e046a965fcdd5624a37cdaaeb2eae616859bc0cf11f7f95be2d10095e98c025ec47a'
            '7f028a1ef22f9c89a3a3a027a3967d51df9881591499d4a5e3ed9cc7c29b1a3cbadf31ab44604acf7af8055ac13080acc55ce5b98b3e35e85989cdff486070b1')






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
install  -Dm755 gfwlist-route  "$pkgdir/usr/lib/$pkgname/gfwlist-route"
install  -Dm755 iproutefile  "$pkgdir/usr/bin/iproutefile"
install  -Dm644 gfwlist-route.service  "$pkgdir/usr/lib/systemd/system/gfwlist-route.service"
install  -Dm644 gfwlist-route.timer  "$pkgdir/usr/lib/systemd/system/gfwlist-route.timer"
install  -Dm755 route-cn  "$pkgdir/usr/bin/route-cn"
install  -Dm755 route-ar  "$pkgdir/usr/bin/route-ar"
install  -Dm755 route-cr  "$pkgdir/usr/bin/route-cr"
}

groups=('lcj')

