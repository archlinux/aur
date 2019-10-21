# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=secure-boot
pkgver=1.4.1
pkgrel=1
epoch=
pkgdesc="secure-boot tool"
arch=(any)
url="https://github.com/gdamjan/secure-boot"
license=('GPL')
groups=()
depends=('efitools' 'sbsigntools' 'make' 'efibootmgr' 'util-linux' 'binutils' 'systemd')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("secure-boot" "secure-boot.hook" "fwupd.hook" "95-secure-boot.install" )
noextract=()

package() {
    cd "${srcdir}"
    install -dm700 "${pkgdir}"/etc/secure-boot
    install -Dm755 secure-boot "${pkgdir}"/usr/bin/secure-boot
    install -Dm644 secure-boot.hook "${pkgdir}"/usr/share/libalpm/hooks/99-secure-boot.hook
    install -Dm644 fwupd.hook "${pkgdir}"/usr/share/libalpm/hooks/fwupd.hook
    install -Dm644 95-secure-boot.install "${pkgdir}"/usr/lib/kernel/install.d/95-secure-boot.install
}

sha256sums=('d1dcbc4fcc42bfe2e506d87ee383174c59b8f5d34786ee90169a7b3e1682cf72'
            'dbf3eb8f6424a44022ee5e8962388f6f73db9176ac0857d43ef4c95015c3d88b'
            '70466aa19cb38aedb210fb16a893f317412c9fc6f15169958583709d2954c67b'
            '62da3ec34fa9370d6877fe371e3536bab6255b2fb5353ef6c0e1adf4c555adcf')
