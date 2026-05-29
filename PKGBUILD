# Maintainer: yorukai <https://github.com/yorukai>
pkgname=alc298-hda-init
pkgver=1.0
pkgrel=1
pkgdesc="Initialize the Realtek ALC298 codec using hda-verb"
arch=('x86_64')
url="https://github.com/yorukai/alc298-init"
license=('MIT')
install="${pkgname}.install"
depends=('alsa-utils')
source=('alc298-hda-init.sh'
        'alc298-hda-init.service'
        'LICENSE')
sha256sums=('848127ab71f638b12c20695cdb60d71b73d5c7fbbff32311e854543ea6ebcfb8'
            '44467bbee04f9a55d07117526f368835fdcdcadf088026a43a0c63d0c20163a6'
            '48514bb345dc9819b16dd5084e2e1bbebe0e9c791c32af1efde1aa7cc6b3afed')

package() {
    install -Dm755 "${srcdir}/alc298-hda-init.sh" \
        "${pkgdir}/usr/share/${pkgname}/alc298-hda-init.sh"

    install -Dm644 "${srcdir}/alc298-hda-init.service" \
        "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
