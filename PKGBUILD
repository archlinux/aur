pkgname="n80-printer-driver"
pkgver="1.0.5"
pkgrel="1"
pkgdesc="Installs the driver tarball for the N80 Thermal printer (sold by the company NDYIN)"
arch=("x86_64" "i686" "aarch64" "armv7")
options=('!debug')
url="https://ndyin.com"
depends=("cups")
optdepends=("cups-pdf")
license=("custom")
source=("https://cdn.shopify.com/s/files/1/0608/6128/4400/files/N80-Driver-Linux-v1.0.5.tar.gz")
sha512sums=("e59b002843944ec715d08ec5603c41465039bea06e5a4811ced0aa5cd72ff0f2acc2ec4d8ccc71c636a7e15bd976b5f2d7a14554cb9c8aba4fcfae84bc381db1")

package() {
  mkdir -p "${pkgdir}/usr/share/cups/model/"
  mkdir -p "${pkgdir}/usr/lib/cups/filter/"


  # If x86-64
  /usr/bin/install -m 755 "${srcdir}/Linux_ZHJY-N80_driver_v1.0.5/filter/x86_64/rastertoN80" "${pkgdir}/usr/lib/cups/filter/rastertoN80"

  /usr/bin/install -m 755 -d "${pkgdir}/usr/share/cups/model/"
  /usr/bin/install -m 644 "${srcdir}/Linux_ZHJY-N80_driver_v1.0.5/ppd/ZHJY-N80.ppd" "${pkgdir}/usr/share/cups/model/"

}

