# Maintainer: Bill Sun <cap.sensitive at gmail dot com>
# Contributer: Jamie Nguyen <jamie at tomoyolinux dot co dot uk>

pkgname=bashmount
pkgver=4.2.5
pkgrel=1

pkgdesc="A menu-driven bash script for the management of removable media with udisks."
arch=('any')
url='https://github.com/jamielinux/bashmount'
license=('GPL2')

optdepends=('udisks2')
backup=(etc/bashmount.conf)
source=("https://github.com/jamielinux/${pkgname}/archive/${pkgver}.tar.gz")

package()
{
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install script
    install -D -m755 bashmount "${pkgdir}/usr/bin/bashmount"

    # Install config file
    install -D -m644 bashmount.conf "${pkgdir}/etc/bashmount.conf"

    # install man page
    gzip -c -9 bashmount.1 > bashmount.1.gz
    install -D -m644 bashmount.1.gz "${pkgdir}/usr/share/man/man1/bashmount.1.gz"

    # Install documentation
    install -d -m755 "${pkgdir}/usr/share/doc/bashmount"
    # Currently the source code doesn't have an 'AUTHORS' file
    #install -m644 AUTHORS "${pkgdir}/usr/share/doc/bashmount/AUTHORS"
    install -m644 COPYING "${pkgdir}/usr/share/doc/bashmount/COPYING"
    install -m644 NEWS "${pkgdir}/usr/share/doc/bashmount/NEWS"
}

sha256sums=('23e758b124320bf0f303f8366dd58fa4d4e1c2a972f9dfe3a82bc70dae674ed1')
