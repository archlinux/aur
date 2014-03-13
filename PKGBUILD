# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=un-apple-keyboard
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="Make Apple keyboards like all your other keyboards"
arch=('any')
url="http://tavianator.com"
license=('custom:WTFPL')
groups=()
depends=('keyfuzz')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('10-apple-keyboard.rules'
        'fix-apple-keyboard'
        'apple_keyboard.keyfuzz'
        'hid_apple.conf'
        'LICENSE')
md5sums=('6a3b7cc9f479ebeb9cbe1c4be2bacdc7'
         '23db0a70399ede5df5510b1e86c89ca4'
         '4cba96fa875bea22b7c69bc7e7531a6c'
         '35019f48e80ec0bf9a23894583248926'
         'f312a7c4d02230e8f2b537295d375c69')
sha256sums=('3ad9b8aead82065127fde1fa956c7a511027567073ac0834c16dad27a4d3ccde'
            'fdf61a06d4c524d8f4e1c144442fece3c1a7a03b4b4da01c1af22d9b97f58c9a'
            'fb0fdb5160c55b52a1f6d5e80c2045919afc4e5306e592abe86cbb3b8af2c643'
            '223edb42311684dc7585b4af25d7fc27ba629a66060b520283d0ebf95a39dc78'
            '96f17857f3eb28a7d93dad930bc099a3cb65a9a2afb37069bfd1ba5ec5964389')

package() {
    install -D -m644 "${srcdir}/10-apple-keyboard.rules" "${pkgdir}/etc/udev/rules.d/10-apple-keyboard.rules"
    install -D -m755 "${srcdir}/fix-apple-keyboard" "${pkgdir}/usr/bin/fix-apple-keyboard"
    install -D -m644 "${srcdir}/apple_keyboard.keyfuzz" "${pkgdir}/etc/keyfuzz/apple_keyboard.keyfuzz"
    install -D -m644 "${srcdir}/hid_apple.conf" "${pkgdir}/etc/modprobe.d/hid_apple.conf"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
