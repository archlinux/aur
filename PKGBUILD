# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: Sol Bekic <s+aur at s-ol dot nu>
# original PKGBUILD by tsujigiri <helge@rausch.io>

_pkgname=vcvrack
pkgname=${_pkgname}-bin
pkgver=2.1.2
pkgrel=1
pkgdesc='Open-source virtual modular synthesizer'
url='https://vcvrack.com/'
license=('GPL3')
arch=('x86_64')
provides=('vcvrack' 'vcvrack-fundamental')
conflicts=('vcvrack' 'vcvrack-fundamental')
depends=('alsa-lib' 'libglvnd' 'zenity')
optdepends=('jack' 'libpulse')
source=("https://vcvrack.com/downloads/RackFree-$pkgver-lin.zip"
        vcvrack.desktop
        vcvrack)
sha256sums=('1356eb9d0cc96b1a8d599bfe66cb9531f0de8c47cbf192463bc62f4a0fbd5327'
            '37208ccb5cdd319fce9d05aa913bc657d582b2371ef0f51b3a7e04586ac0f717'
            'd98a5e0c8d811aa9edf0040570e5363da712d676b46e82b2c64e8aad4b876417')

package() {
	mkdir -p "$pkgdir/opt/"
	cp -R Rack2Free "$pkgdir/opt/$_pkgname"

	install -d "${pkgdir}/usr/share/applications"
	install ../vcvrack.desktop "${pkgdir}/usr/share/applications"

	install -D vcvrack "$pkgdir/usr/bin/vcvrack"
}
