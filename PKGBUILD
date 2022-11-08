# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=bootdisk
pkgver=0.1
pkgrel=2
pkgdesc="Simple command to boot device with QEMU/KVM"
arch=('any')
url="https://github.com/MatMoul/bootdisk"
license=('GPL3')
depends=('qemu' 'edk2-ovmf' 'swtpm')
provides=("bootdisk=${pkgver}")
source=("git+https://github.com/MatMoul/${pkgname}.git")
#source=("git://github.com/MatMoul/${pkgname}.git#branch=")
md5sums=('SKIP')

build() {
	cd ${pkgname}
}

package() {
	cd ${pkgname}
	install -Dm755 "src/bootdisk" "${pkgdir}/usr/bin/bootdisk"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
