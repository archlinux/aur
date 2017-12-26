_pkgbase=alx-wol
pkgname=${_pkgbase}-dkms
pkgver=2
pkgrel=1
pkgdesc="The alx kernel module with a patch enabling WoL applied"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
optdepends=('linux-headers: Needed for build the module for Arch kernel'
	'linux-lts-headers: Needed for build the module for LTS Arch kernel'
	'linux-zen-headers: Needed for build the module for ZEN Arch kernel')
source=(https://raw.githubusercontent.com/angelsl/linux/alx-wol/drivers/net/ethernet/atheros/alx/{alx.h,ethtool.c,hw.c,hw.h,main.c,reg.h}
        Kbuild
        dkms.conf)
sha256sums=('b4f78f21c3485680f1533002771a268ce869863f8684c0fc67e8a938a6276ae9'
            '922f2837b5b7bb51bb112e53a22ee4883acfcb53b83c4b79bf9d7a99d032f6fd'
            'fa609e88b05e1597f9734c4b625a00771cf4d70aa65b054664b1eda3c29dac77'
            'a0b0b41752a8b69a5ef31574501897c3631e007ea8f8232732df1e2ebdf28e6f'
            'af49b2027f8d3ee2f2480fad79b3867054d73e6537612724599eed6bcd2bec6d'
            '88a23ab8e6fe814efe81910bd8806f5988d367a628458154edaebdf4ccbe4902'
            '8a62bb5adf6e554f470f88f8da58da0ce05cb8276ab56fb45ed5d31c71665d39'
            'f3aefc85fd246a74ee2be831c15b6440d22c497e84fba1f57e152c82f2946d1a')

package() {
    local dest="$pkgdir/usr/src/${_pkgbase}-$pkgver"
    mkdir -p $dest
    cp -a Kbuild dkms.conf alx.h ethtool.c hw.c hw.h main.c reg.h $dest
}
