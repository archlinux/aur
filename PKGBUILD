# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pia-tools-orig
pkgver=0.9.4
pkgrel=1
pkgdesc='OpenVPN hook for privateinternetaccess.com'
arch=('any')
url='https://github.com/pschmitt/pia-tools'
license=('GPL3')
depends=('transmission-cli' 'dnsutils' 'openvpn' 'systemd' 'sudo' 'wget' 'ufw' 'unzip')
source=('https://raw.github.com/pschmitt/pia-tools/master/pia-tools'
        'https://raw.github.com/pschmitt/pia-tools/master/pia-tools.groff'
        'https://raw.github.com/pschmitt/pia-tools/master/pia@.service'
        'https://raw.github.com/pschmitt/pia-tools/master/pia_common'
        'https://raw.github.com/pschmitt/pia-tools/master/pia-tools.install')
sha256sums=('8d71a896e9bff8e118d10798a88dd772ed03a420fc5f7760f268907c64506312'
            '35ddc09ca81f1667653d0809cf4fc9b515ce5cfd0011cb3bd6bfa1cc69a3fc03'
            'ca889526b3154f221ec57df982c887c6fd02f5be15310fbe25b14d701d4fa394'
            '6c8d6b9024b3e782932dee0f0c917b9eb9f2a4d8ec6da26428d0abe751447b9b'
            '6e1c7a5c0dd90cce431eec928767427caed8a19c9e094691d522fed8b8eedc08')
install="pia-tools.install"

package() {
    cd "${srcdir}"
    install -Dm755 pia-tools "${pkgdir}/usr/bin/pia-tools"
    install -Dm644 pia-tools.groff "${pkgdir}/usr/share/man/man1/pia-tools.1"
    install -Dm644 pia@.service "${pkgdir}/usr/lib/systemd/system/pia@.service"
    install -Dm644 pia_common "${pkgdir}/etc/openvpn/pia/pia_common"
}

