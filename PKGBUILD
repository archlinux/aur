# Maintainer: Stefan Melmuk <stefan.melmuk@gmail.com>

pkgname=lightdm-guest-account
pkgver=1.32.0
pkgrel=1
pkgdesc="LightDM shell script to enable guest account session."
arch=('any')
url="https://github.com/canonical/lightdm"
license=('GPL')
optdepends=('lightdm: display manager with guest-session support')
conflicts=('lightdm-guest')
source=(
	guest-account.sh	
	lightdm-autologin.sysusers
)
options=(
        emptydirs
)
sha256sums=(
        'e66a6b385e2f365f70da8eab98b7c556939920b9fe980359b5f91c13d4d519cd'
        'de4191ebe7bd07724e0257bb748de56f6c9fc49e76af9a756363bdfc9a66dfa2'
)

package() {
	install -dm 755 "${pkgdir}"/usr/bin
	install -m 755 guest-account.sh "${pkgdir}"/usr/bin/guest-account

	install -dm 755 "${pkgdir}"/usr/lib/sysusers.d
        install -m 644 lightdm-autologin.sysusers "${pkgdir}"/usr/lib/sysusers.d/lightdm-autologin.conf

        install -dm 755 "${pkgdir}"/etc/guest-session/skel
}
