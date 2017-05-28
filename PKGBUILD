_pkgbase=ideapad-laptop-updated
pkgname=${_pkgbase}-dkms
pkgver=1
pkgrel=1
pkgdesc="A kernel module for Lenovo IdeaPad laptops"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
optdepends=('linux-headers: Needed for build the module for Arch kernel'
	'linux-lts-headers: Needed for build the module for LTS Arch kernel'
	'linux-zen-headers: Needed for build the module for ZEN Arch kernel')
source=(https://raw.githubusercontent.com/angelsl/linux/0f685d78bee2bea953f34a13da21b77b4906587c/drivers/platform/x86/ideapad-laptop.c
        Kbuild
        dkms.conf)
sha256sums=('d1371034e56ded1a220cee4965efcb68fd50547beafc9ef73483d179e07dc277'
            'fac0c89fb000f8d1474c61202a60135389f3ebee6d434c21460cf19f9f149fa2'
            '43e57b38be0e304a81290041cfb3466c779053d0085e8eaa0b20f3c2cb528048')

package() {
    local dest="$pkgdir/usr/src/${_pkgbase}-$pkgver"
    mkdir -p $dest
    cp -a Kbuild dkms.conf ideapad-laptop.c $dest
}
