# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=smdev-runit
pkgver=20181226
pkgrel=1
pkgdesc="runit stage1 script for smdev"
arch=('any')
license=('MIT/X')
depends=('smdev' 'runit')
source=("smdev")
sha256sums=('cb074845e712f51851b250490f3237da9834025bf3adce13bc4e41dc1a808216')

package() {
    install -Dm755 "${srcdir}/smdev" "${pkgdir}/usr/lib/rc/sv.d/smdev"

    # create default symlinks?
    # smdev doesn't conflict with udev
    install -d ${pkgdir}/etc/rc/sysinit
    ln -sf /usr/lib/rc/sv.d/smdev ${pkgdir}/etc/rc/sysinit/30-smdev
}
