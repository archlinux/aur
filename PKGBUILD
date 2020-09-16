# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=secure-boot
pkgver=1.5.0
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
source=("${url}/archive/v${pkgver}.tar.gz")
noextract=()

package() {
    cd ${pkgname}-${pkgver}
    install -dm700 "${pkgdir}"/etc/secure-boot
    install -Dm755 secure-boot "${pkgdir}"/usr/bin/secure-boot
    install -Dm644 secure-boot.hook "${pkgdir}"/usr/share/libalpm/hooks/99-secure-boot.hook
    install -Dm644 fwupd.hook "${pkgdir}"/usr/share/libalpm/hooks/fwupd.hook
    install -Dm644 95-secure-boot.install "${pkgdir}"/usr/lib/kernel/install.d/95-secure-boot.install
}

sha256sums=('156ca6399263b7df3feae69e90a12c06cb8552d732c43560b23e214a13c0cded')
