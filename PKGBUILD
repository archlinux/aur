# Maintainer: Felix Golatofski <contact@xdfr.de>

_pkgname=excavator
pkgname=$_pkgname-bin
pkgver=1.5.14a
pkgrel=1
pkgdesc="Excavator by NiceHash. NiceHash's proprietary low-level CUDA miner."
arch=("x86_64")
url="https://github.com/nicehash/excavator"
license=("custom")
depends=('nvidia-utils' 'libpciaccess' 'libx11>=1.4.99.1' 'libxext' 'ocl-icd>=1.0' 'cuda')
options=('!strip' '!emptydirs')
provides=('excavator')
conflicts=('excavator')
replaces=('excavator')
source=("https://github.com/nicehash/$_pkgname/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
	"https://raw.githubusercontent.com/nicehash/$_pkgname/master/$_pkgname-EULA.txt")
sha512sums=('d3f8b8903d249f5218470bcdfe73651d3a13062007d9b8658c7c93c65ef89c15b189fd71b3475c8ccf90399850774987d577e8a2f7a356f09c3a3806b12ac42b'
            '281a4d333e7e3133d3779d2977ef9a9a2742c2f721118d29881e4543734f8201d909a3e78d8d2fb59904d6603a03db73caa280942fccd93949cab60eabc5cc37')
package(){
  tar --no-same-owner -xJC "$pkgdir" -f data.tar.xz
  install -Dm644 $srcdir/excavator-EULA.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  rm -rf "$pkgdir/opt"
}
