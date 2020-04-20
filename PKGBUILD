# Maintainer: AK <crt@archlinux.email>

pkgname=check_email_delivery
pkgver=0.7.1b
pkgrel=1
pkgdesc="The check_email_delivery plugin uses the included Nagios plugins to check on a complete email loop."
arch=('any')
url="http://buhacoff.net/software/check_email_delivery/"
license=('GPL3')
depends=('perl-mail-imapclient')
source=("http://buhacoff.net/software/check_email_delivery/archive/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d1fdc3082e443b4f54f230eb6231581edf6563d0012c333ef50a35b26579f93568cee8b70cfb2dfc332d0eceb5add31a8c7f93681d2baeeb08d229c0de32ac39')

package() {
    cd ${pkgname}-${pkgver}
    # Install License
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   
    # Put check_email_delivery checks in /usr/lib/monitoring-plugins
    install -Dm755 "check_email_delivery"       "$pkgdir/usr/lib/monitoring-plugins/check_email_delivery"
    install -Dm755 "check_email_delivery_epn"   "$pkgdir/usr/lib/monitoring-plugins/check_email_delivery_epn"
    install -Dm755 "check_imap_receive"         "$pkgdir/usr/lib/monitoring-plugins/check_imap_receive"
    install -Dm755 "check_imap_receive_epn"     "$pkgdir/usr/lib/monitoring-plugins/check_imap_receive_epn"
    install -Dm755 "check_smtp_send"            "$pkgdir/usr/lib/monitoring-plugins/check_smtp_send"
    install -Dm755 "check_smtp_send_epn"        "$pkgdir/usr/lib/monitoring-plugins/check_smtp_send_epn"
}

