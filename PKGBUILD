# Maintainer:  Alex Mekkering <amekkering at gmail dot com>

pkgname=systemd-unit-status-mail

pkgver=1.0.0
pkgrel=1
pkgdesc="Service to mail a systemd's unit status"
arch=(any)
license=('GPL3')
depends=('coreutils' 'smtp-forwarder')
source=('unit-status-mail' 
        'unit-status-mail@.service'
)
sha256sums=('f7f5808650bd09d75707059a918f451d7f150ff26e0e64526ed4e9e4ff2a80f1'
            '7905bce82e8bbf387358f0360eeac49d6724a06eae0be1b8db5ae4ae8d4c8732')

package() {
    install -D -m 755 "$srcdir/unit-status-mail" "$pkgdir/usr/bin/unit-status-mail"
    install -D -m 644 "$srcdir/unit-status-mail@.service" "$pkgdir/usr/lib/systemd/system/unit-status-mail@.service"
}
