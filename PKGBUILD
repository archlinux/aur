# Maintainer: Fabian Bornschein <plusfabi@gmail.com>
pkgname=blacklist_pcspkr
pkgdesc="Disables the pcspkr completely"
install="blacklist_pcspkr.install"
pkgver=1
pkgrel=1
arch=('any')
license=('GPL3')
source=('blacklist_pcspkr.hook'
	'blacklist_pcspkr.conf'
	'blacklist_pcspkr.install')
sha512sums=('06e650611a64016f6f4db20ecb73e630d9baaf8df6035a4fe75d13d9024e307847c5473f2d2913f2052207e163f24e480979994567842ca361398a5656759341'
            '64db688ca3d30cb8a311dab26c291c4b4cb6dc52f4c4da318d051a3a89be95331217ba0d846ab06e3d124c36d2d486e81a212da0eb20067aa81fae571212b087'
            '9fbd730a6541d31d36128906a9eb66204e7bd12b2f5e70d170ab1ec2005e3ab8519cf1834dbfe95adcffe1df98405561b59030e43f5c84144ee1c195b1fa41f0')

package()
{
    cd "${srcdir}"

    install -D -m644 "${srcdir}/blacklist_pcspkr.conf" \
    "${pkgdir}/usr/lib/modprobe.d/blacklist_pcspkr.conf"

    install -D -m644 "${srcdir}/blacklist_pcspkr.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/98-blacklist_pcspkr.hook"
}
