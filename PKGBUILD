# Maintainer: Ismael Castiñeira <isma.casti at gmail dot com>
pkgname=plop-bootmanager
pkgver=5.0.15
pkgrel=1
epoch=
pkgdesc="Bootloader that can boot from USB and CDROM on old machines without BIOS support"
arch=('i686' 'x86_64')
url="https://www.plop.at/en/bootmanagers.html"
license=('custom')
groups=()
depends=()
makedepends=('unzip')
checkdepends=()
optdepends=('grub: boot menu support')
provides=()
conflicts=("plpbt")
replaces=()
backup=()
options=()
source=(
    "https://download.plop.at/files/bootmngr/plpbt-$pkgver.zip"
    "80_plopboot"
)
noextract=()
md5sums=()
validpgpkeys=()


package() {
    install -Dm755 80_plopboot "$pkgdir/etc/grub.d/80_plopboot"
    cd "plpbt-$pkgver"
    install -Dm644 plpbt.bin "$pkgdir/boot/plop/plpbt.bin"
    install -Dm644 licence.txt "$pkgdir/usr/share/licenses/$pkgname/licence.txt"
}
md5sums=('e18c033d56ad25b3ebf057cc069cf9cd'
         '6bf160531549e2b89b01acd508049010')
