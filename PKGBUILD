# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=un-apple-keyboard
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Make Apple aluminium keyboards like all your other keyboards"
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
source=('10-apple-aluminium.rules'
        'fix-apple-keyboard'
        'apple_aluminium.keyfuzz'
        'hid_apple.conf'
        'LICENSE')
md5sums=('6b0fcc198b384bd3bb7147fd2b4c60bd'
         '2f42654055cb7bcba6c217df96e84fee'
         'f0c831773a34dbbe0f4a60f36ebdea53'
         '02a1d43b71095533cb1e7d222d1dcc84'
         'f312a7c4d02230e8f2b537295d375c69')

package() {
    install -D -m644 "${srcdir}/10-apple-aluminium.rules" "${pkgdir}/etc/udev/rules.d/10-apple-aluminium.rules"
    install -D -m755 "${srcdir}/fix-apple-keyboard" "${pkgdir}/usr/bin/fix-apple-keyboard"
    install -D -m644 "${srcdir}/apple_aluminium.keyfuzz" "${pkgdir}/etc/keyfuzz/apple_aluminium.keyfuzz"
    install -D -m644 "${srcdir}/hid_apple.conf" "${pkgdir}/etc/modprobe.d/hid_apple.conf"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
