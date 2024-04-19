# Maintainer: Squid <cyberneticsquid@gmail.com>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: Sol Bekic <s+aur at s-ol dot nu>
# original PKGBUILD by tsujigiri <helge@rausch.io>

_pkgname=vcvrack
pkgname=${_pkgname}-bin
pkgver=2.5.1
pkgrel=2
pkgdesc='Open-source virtual modular synthesizer'
url='https://vcvrack.com/'
license=('GPL-3.0-or-later')
arch=('x86_64')
provides=('vcvrack' 'vcvrack-fundamental')
conflicts=('vcvrack' 'vcvrack-fundamental')
depends=('alsa-lib' 'libglvnd' 'zenity')
optdepends=('jack' 'libpulse')
source=("https://vcvrack.com/downloads/RackFree-$pkgver-lin-x64.zip"
        vcvrack.desktop
        vcvrack)
sha256sums=('559c25119eb61c92f05d7ab3247f7ec9668eac74fc7616a86f5d38e336c241bd'
            '37208ccb5cdd319fce9d05aa913bc657d582b2371ef0f51b3a7e04586ac0f717'
            'd98a5e0c8d811aa9edf0040570e5363da712d676b46e82b2c64e8aad4b876417')

package() {
	mkdir -p "$pkgdir/opt/"
	cp -R Rack2Free "$pkgdir/opt/$_pkgname"

	install -d "${pkgdir}/usr/share/applications"
	install vcvrack.desktop "${pkgdir}/usr/share/applications"

	install -D vcvrack "$pkgdir/usr/bin/vcvrack"
}
