_pkgbase=alx-wol
pkgname=${_pkgbase}-dkms
pkgver=1
pkgrel=1
pkgdesc="The alx kernel module with a patch enabling WoL applied"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
optdepends=('linux-headers: Needed for build the module for Arch kernel'
	'linux-lts-headers: Needed for build the module for LTS Arch kernel'
	'linux-zen-headers: Needed for build the module for ZEN Arch kernel')
source=(https://github.com/angelsl/linux/blob/alx-wol/drivers/net/ethernet/atheros/alx/{alx.h,ethtool.c,hw.c,hw.h,main.c,reg.h}
        Kbuild
        dkms.conf)
sha256sums=('afcd186a4710868ba7206bfcebdee5a6adc48e4853a2f7595f4f7c3df0f345af'
            'ddba0a3acd62fab181f4de3ffeb85accfcee50110f8aa4762bec6958f235cc0e'
            'd775716e32c49ab17455067e1027e3039421444ba515d6e477b2aa3558e6932d'
            '339bb5b3ce4cc99d45740ff8af7afe3a935ee7a7e031027ae91f9e350da38b39'
            'e82a3d467fc8ca44c8ca1e9ba0d8027bc5491c65569a68471fdf580eb82b624d'
            'dfe82e1d26935071b582d5f287f98a4487ee6b7a2f470ee23a9e23b841ef3282'
            '8a62bb5adf6e554f470f88f8da58da0ce05cb8276ab56fb45ed5d31c71665d39'
            'f3aefc85fd246a74ee2be831c15b6440d22c497e84fba1f57e152c82f2946d1a')

package() {
    local dest="$pkgdir/usr/src/${_pkgbase}-$pkgver"
    mkdir -p $dest
    cp -a Kbuild dkms.conf alx.h ethtool.c hw.c hw.h main.c reg.h $dest
}
