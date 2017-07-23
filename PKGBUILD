# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=systemd-hddapm
pkgver=1.6
pkgrel=2
pkgdesc="Hard Disk APM level service for systemd"
arch=('any')
url="https://sourceforge.net/projects/hddapm"
license=('GPL')
depends=('hdparm' 'systemd')
backup=('etc/udev/rules.d/10-hddapm.rules')
install=$pkgname.install
source=("https://downloads.sourceforge.net/project/hddapm/hddapm-${pkgver}.tar.gz")
sha256sums=('9d70aeb3cbbd918a1b2473d957be5ec31611f6a6a0d30337d2aa571c8c47be83')

package() {
    # Install script, service file and mkinitcpio hook
    install -Dm644 "${srcdir}/hddapm.service" "${pkgdir}/usr/lib/systemd/system/hddapm.service"
    install -Dm644 "${srcdir}/hddapm.initinstall" "${pkgdir}/usr/lib/initcpio/install/hddapm"
    install -Dm644 "${srcdir}/10-hddapm.rules" "${pkgdir}/etc/udev/rules.d/10-hddapm.rules"
}




