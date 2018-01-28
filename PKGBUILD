# Maintainer: TheGoliath
pkgname=ewbf-miner
pkgrel=5
_pkggit=0.3.4b
pkgver=v0.3.4b
pkgdesc="EWBF's CUDA Zcash miner"
arch=('x86_64')
url="https://github.com/nanopool/ewbf-miner"
license=('https://github.com/nanopool/ewbf-miner/blob/master/README.md')
groups=('')
depends=('nvidia-utils' 'opencl-nvidia' 'libpciaccess' 'libx11>=1.4.99.1' 'libxext' 'ncurses' 'ocl-icd>=1.0' 'nvidia')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/nanopool/ewbf-miner/releases/download/${pkgver}/Zec.miner.${_pkggit}.Linux.Bin.tar.gz"
	       "https://raw.githubusercontent.com/GoliathLabs/ewbf-script/master/ewbf-miner")
sha512sums_x86_64=('435467b1286dafdf93c4d2ff5d856ab2d8253b4835660d8fc88cd9cd4fe9ea21545021bfe082891dbb3dace3e4abfa052cad7b398a31099bcefd9392db4e31b7'
		   '1660e76fc242ec7fd517431bc6fc713ebb83661ce1c5f25d1f799a17d6c2a28ee69727275025a333c40d5219f2d92fab744cc9f82cf8f729b44ac8a61e4c03f2')
package(){

	# Extract package data
	tar xvzf Zec.miner.${_pkggit}.Linux.Bin.tar.gz -C "${srcdir}"
	mkdir -p "${pkgdir}/etc/ewbf-miner"
	install -D -m755 "${srcdir}/miner" -t "${pkgdir}/usr/lib/"
	install -D -m644 "${srcdir}/miner.cfg" "${pkgdir}/etc/ewbf-miner/"
	install -D -m644 "${srcdir}/Help.txt" "${pkgdir}/etc/ewbf-miner/"
	install -D -m755 "ewbf-miner" -t "${pkgdir}/usr/bin"
	echo "You now have to edit the /etc/ewbf-miner/miner.cfg file properly, to fit your needs!"
}
