# Maintainer: taotieren <admin@taotieren.com>

pkgname=juicevm-bin
pkgver=2.0.0
pkgrel=2
pkgdesc="Juice Vm is a small RISC-V virtual machine and run the latest kernel.The chip which contain hundreds of KB RAM can run this virtual machine,but it wouldn't contain any third-party libraries. "
arch=('x86_64')
url="https://github.com/juiceRv/JuiceVm"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname%-bin} ${pkgname/bin/git} )
#replaces=(${pkgname})
depends=('bash')
makedepends=('libarchive')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("http://xiaohui.mongoyun.com:3333/pool/main/j/juicevm/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('f72b999e0492bff8e4f5da6fc37672c6257927d8fdc0990902fd9385c0cfa229')

#noextract=("")

package() {
    bsdtar -xf "${srcdir}/data.tar.xz"  --no-same-owner  --no-same-permissions -C "${pkgdir}/"
}
