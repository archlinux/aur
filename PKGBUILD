# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pia-tools-orig
pkgver=0.9.3
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
sha256sums=('3c30fabca083e19754ec0547bfefa65a26592a698c2d985bab7bcbaac6ecba96'
            '5a1ffc5094428d70bb0e19f1cc7eec7544b1ad9154a653f75b64f8ac1aeec867'
            'ca889526b3154f221ec57df982c887c6fd02f5be15310fbe25b14d701d4fa394'
            '326197a42525e640432e6ceb3fd0cfe6bbab2324bc607babaa89fb3c80971828'
            'da696c2b1521220b4c7b8df14665bc4204e8b03b7e7b7bbcd9f665556c7bfe19')
install="pia-tools.install"

package() {
    cd "${srcdir}"
    install -Dm755 pia-tools "${pkgdir}/usr/bin/pia-tools"
    install -Dm644 pia-tools.groff "${pkgdir}/usr/share/man/man1/pia-tools.1"
    install -Dm644 pia@.service "${pkgdir}/usr/lib/systemd/system/pia@.service"
    install -Dm644 pia_common "${pkgdir}/etc/openvpn/pia/pia_common"
}

