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
source=(https://raw.githubusercontent.com/angelsl/linux/aad33b89d5735a156512f5d1052ade7cbd070fce/drivers/platform/x86/ideapad-laptop.c
        Kbuild
        dkms.conf)
sha256sums=('26b1de6f4e9d7e72fd0f6fc2cf286eefb497cf3bc4ce94e83f99d91e1b815196'
            'fac0c89fb000f8d1474c61202a60135389f3ebee6d434c21460cf19f9f149fa2'
            '43e57b38be0e304a81290041cfb3466c779053d0085e8eaa0b20f3c2cb528048')

package() {
    local dest="$pkgdir/usr/src/${_pkgbase}-$pkgver"
    mkdir -p $dest
    cp -a Kbuild dkms.conf ideapad-laptop.c $dest
}
