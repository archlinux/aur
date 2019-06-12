# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=secure-boot
pkgver=1.3.1
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

sha256sums=('8140d52cce7ca1424dcfdf57e5bf5e162671710764ddb66d3112f40236c39f0f'
            '9252561fd43bc707e062ce266f7e55ceff9cd56ad00bde003ba93a61aaf27922'
            '70466aa19cb38aedb210fb16a893f317412c9fc6f15169958583709d2954c67b'
            '62da3ec34fa9370d6877fe371e3536bab6255b2fb5353ef6c0e1adf4c555adcf')
