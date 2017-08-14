_pkgbase=ideapad-laptop-updated
pkgname=${_pkgbase}-dkms
pkgver=2
pkgrel=1
pkgdesc="A kernel module for Lenovo IdeaPad laptops"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
optdepends=('linux-headers: Needed for build the module for Arch kernel'
	'linux-lts-headers: Needed for build the module for LTS Arch kernel'
	'linux-zen-headers: Needed for build the module for ZEN Arch kernel')
source=(https://raw.githubusercontent.com/angelsl/linux/db129e471a7184188a0b898fa3f79ac5be82a5b8/drivers/platform/x86/ideapad-laptop.c
        Kbuild
        dkms.conf)
sha256sums=('fa496f0b39afdaf42ea119c250055f1e81d2fd8857aae1daa01372e27d5bc3f3'
            'fac0c89fb000f8d1474c61202a60135389f3ebee6d434c21460cf19f9f149fa2'
            '43e57b38be0e304a81290041cfb3466c779053d0085e8eaa0b20f3c2cb528048')

package() {
    local dest="$pkgdir/usr/src/${_pkgbase}-$pkgver"
    mkdir -p $dest
    cp -a Kbuild dkms.conf ideapad-laptop.c $dest
}
