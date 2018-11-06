# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=xscreensaver-oom-protect
pkgver=1.0.0
pkgrel=1
pkgdesc="Protect xscreensaver from the out-of-memory killer"
arch=('x86_64')
license=('custom:WTFPL')
depends=('xscreensaver')
source=(${pkgname}.c
        LICENSE
        xscreensaver.service)
md5sums=('43175fd1d4dc75bf02311b1cc6de467e'
         '8365d07beeb5f39d87e846dca3ae7b64'
         'bb945c067ae57367ddc6f041fd33dfa4')

package() {
    cd ${srcdir}
    ${CC:-gcc} ${CFLAGS} ${LDFLAGS} -o ${pkgname} ${pkgname}.c
    install -D -m4755 -t ${pkgdir}/usr/bin ${pkgname}
    install -D -m644 -t ${pkgdir}/usr/lib/systemd/user xscreensaver.service
    install -D -m644 -t ${pkgdir}/usr/share/licenses/${pkgname} LICENSE
}
