# Maintainer: Ethan Madison (aur<at>ethanmad<dot>com)

pkgname=pia-tools
pkgver=0.9.7.3
pkgrel=1
pkgdesc='OpenVPN hook for privateinternetaccess.com'
arch=('any')
url='https://github.com/ethanmad/pia-tools'
license=('GPL3')
depends=('transmission-cli' 'bind-tools' 'openvpn' 'systemd' 'sudo' 'wget' 'ufw' 'unzip' 'sed')
source=("pia-tools-$pkgver.tar.gz::https://github.com/ethanmad/pia-tools/archive/$pkgver.tar.gz") 
sha256sums=('03062c8bd5c0cd92dda0278421ca59ca14fff433cb430a200e9e8f56b7cc602e')
install="${pkgname}.install"

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 pia-tools "$pkgdir"/usr/bin/pia-tools
    install -Dm644 pia-tools.groff "$pkgdir"/usr/share/man/man1/pia-tools.1
    install -Dm644 pia@.service "$pkgdir"/usr/lib/systemd/system/pia@.service
    install -Dm644 pia_common "$pkgdir"/etc/openvpn/pia/pia_common
    install -Dm755 pia-up "$pkgdir"/etc/openvpn/pia/pia-up
    install -Dm755 pia-down "$pkgdir"/etc/openvpn/pia/pia-down
}
