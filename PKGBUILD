# Maintainer: TheGoliath
pkgname=ewbf-miner
pkgrel=1
_pkggit=0.3.4b
pkgver=v0.3.4b
pkgdesc="EWBF's CUDA Zcash miner"
arch=('x86_64')
url="https://github.com/nanopool/ewbf-miner"
license=('https://github.com/nanopool/ewbf-miner/blob/master/README.md')
groups=('')
depends=('nvidia-utils' 'opencl-nvidia' 'libpciaccess' 'libx11>=1.4.99.1' 'libxext' 'ncurses' 'ocl-icd>=1.0' 'nvidia')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/nanopool/ewbf-miner/releases/download/${pkgver}/Zec.miner.${_pkggit}.Linux.Bin.tar.gz")
sha512sums_x86_64=('435467b1286dafdf93c4d2ff5d856ab2d8253b4835660d8fc88cd9cd4fe9ea21545021bfe082891dbb3dace3e4abfa052cad7b398a31099bcefd9392db4e31b7')

package(){

	# Extract package data
	mkdir ${srcdir}/extracted
	tar xvzf Zec.miner.${_pkggit}.Linux.Bin.tar.gz -C "${srcdir}"
#	mkdir -p "${pkgdir}/etc/ewbf-miner"
#	mv ${srcdir}/{miner.cfg,Help.txt} ${pkgdir}/etc/ewbf-miner
	install -D -m755 "$srcdir/miner "/usr/bin/ewbf-miner"
	install -D -m644 "$srcdir/{miner.cfg},Help.txt} "/etc/ewbf-miner"
}
