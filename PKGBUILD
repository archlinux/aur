# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rx_tools
pkgver=1.0.3
pkgrel=2
pkgdesc='rx_fm, rx_power, and rx_sdr tools for receiving data from SDRs, based on rtl_fm, rtl_power, and rtl_sdr from librtlsdr, but using the SoapySDR vendor-neutral SDR support library instead, intended to support a wider range of devices than RTL-SDR'
url="https://github.com/rxseger/$pkgname"
arch=('x86_64')
license=('GPL2')
depends=('soapysdr' 'glibc')
makedepends=('cmake')
source=("$url/archive/v$pkgver.zip")
sha256sums=('35ddd6056a67f1ddc3b35c6be91714c765145d6b4cbbea0656ca3f40fee0eb7a')

prepare()
{
    cd "$pkgname-$pkgver"

    cmake . -DCMAKE_INSTALL_PREFIX=/usr
}

build()
{
    cd "$pkgname-$pkgver"

    make
}

package()
{
    cd "$pkgname-$pkgver"

    make DESTDIR="${pkgdir}" install
}
