# Maintainer: bananana <bananana dot aur at glasmail dot de>
# Contributor: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=mooltipass-udev
pkgver=2023011200
pkgrel=1
pkgdesc="Udev rules to connect Mooltipass devices"
arch=('any')
url="https://github.com/mooltipass/mooltipass-udev"
license=('GPL-3.0-or-later')

depends=('libusb'
         'udev')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('00285402ecf887da2a938d8375725fd07553c1ad11e426659a72c42dc0027c82')

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"

        install -Dm 0644 udev/69-mooltipass.rules "${pkgdir}/usr/lib/udev/rules.d/69-mooltipass.rules"
}
