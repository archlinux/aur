pkgname=ta-designer
pkgver=1.31
pkgrel=1
pkgdesc="Graphical UI design software for Technische Alternative devices"
arch=('x86_64' "i386")
url="https://www.ta.co.at"
license=('unknown')
depends=('gtk3')
makedepends=('rpm-tools' 'cpio')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::${url}/fileadmin/Downloads/Software/TA-Designer/Linux/64bit/${pkgname}-${pkgver}-x86_64.rpm")
source_i386=("${pkgname}-${pkgver}-i386.rpm::${url}/fileadmin/Downloads/Software/TA-Designer/Linux/32bit/${pkgname}-${pkgver}-i386.rpm")

sha256sums_x86_64=('4bf6f4c1a4c354e268ce3d476bc501ae718dbb4d3ec101f4ac0f796b35b457e3')
sha256sums_i386=('281a7374ba9e208c53e90ec7d7309fc411c209a435ffc1a6f0cf1edd60d5d8f3')

package() {
  export LC_ALL=C
  rpm2cpio "$pkgname-$pkgver-${CARCH}.rpm" | cpio -idmv -D "${pkgdir}/"
}
