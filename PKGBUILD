# Maintainer: Egor Gavrilov (gavrilovegor519-2@yandex.ru)
pkgbase=gimate-linux-wmi
pkgname=gimate-linux-wmi
pkgver=0.3.1
pkgrel=2
pkgdesc="Kernel module allowing more control on Gigabyte Gaming GiMATE-enabled laptops"
arch=('x86_64')
url="https://github.com/oldzoomer-ru/gimate-linux-wmi"
license=('GPL2')
depends=('dkms')
conflicts=('gigabyte-laptop-wmi-dkms-git')
source=("${url}/releases/download/v${pkgver//_/-}/driver.tar.gz")
sha256sums=("$(curl -sL ${url}/releases/download/v${pkgver//_/-}/sum.txt | cut -d ' ' -f1)")

package() {
    install -Dt "${pkgdir}/usr/src/${pkgname}-${pkgver//_/-}" -m644 Makefile aorus-laptop.c dkms.conf
    install -Dt "${pkgdir}/usr/lib/modules-load.d" -m644 aorus-laptop.conf
}
