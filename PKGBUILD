pkgname=ta-designer
pkgver=1.30.1
pkgrel=1
pkgdesc="Graphical UI design software for Technische Alternative devices"
arch=('x86_64' "i386")
url="https://www.ta.co.at"
license=('unknown')
makedepends=('rpm-tools' 'cpio')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::${url}/fileadmin/Downloads/Software/TA-Designer/Linux/64bit/${pkgname}-${pkgver}-x86_64.rpm")
source_i386=("${pkgname}-${pkgver}-i386.rpm::${url}/fileadmin/Downloads/Software/TA-Designer/Linux/32bit/${pkgname}-${pkgver}-i386.rpm")


sha256sums_x86_64=('9c55e265272765a83f4f2ef7de4de075d22b03c02b7603cdf131ca7504692171')
sha256sums_i386=('f40d124844e67aafac4bda58107d15e316ca6b40f1835b05765fb0023f400375')

package() {
  export LC_ALL=C
  rpm2cpio "$pkgname-$pkgver-${CARCH}.rpm" | cpio -idmv -D "${pkgdir}/"
}
