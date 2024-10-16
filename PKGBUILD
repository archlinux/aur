# Maintainer: Sid Pranjale <sidpranjale127@protonmail.com>
pkgname=pmconfig
pkgver=0.0.2
pkgrel=1
pkgdesc="A set of tweaks for power efficiency picked from the Arch Wiki"
arch=("x86_64")
url="https://gitlab.com/Sid127/pmconfig"
licelse=("GPL3")
depends=('iw' 'tuned' 'tuned-ppd')
makedepends=()
source=('10-camera-pm.conf'
        'udev.rules'
        'sysctl.conf'
        'modprobe.conf')
sha256sums=('1b1e16daa69a081c8d347825d5c7461736220af49a4a35ba66ba5124a66a09b2'
            'b71d8bf9ce407ee0101cb8ecd5b7aa4309d911fa0fca2f22b6c68c3437003bc9'
            '5b3891fd227c744dca55ace450f2edcd6d6a885b4c5d80720d0ea3b1103149ec'
            'f2fb57c896c14508485b76456348d9ab29e61d9f0760e48ddc8c5db696a9ce71')

package() {
    install -D -m 644 10-camera-pm.conf $pkgdir/etc/wireplumber/wireplumber.conf.d/10-camera-pm.conf
    install -D -m 644 modprobe.conf $pkgdir/etc/modprobe.d/pmconfig.conf
    install -D -m 644 sysctl.conf $pkgdir/etc/sysctl.d/pmconfig.conf
    install -D -m 644 udev.rules $pkgdir/etc/udev/rules.d/pmconfig.rules
}
