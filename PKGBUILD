# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=rx_tools
pkgver=1.0.3
pkgrel=4
pkgdesc='Implementation of librtlsdr rtl_* tools using SoapySDR as the driver backend'
url="https://github.com/rxseger/rx_tools"
arch=('x86_64')
license=('GPL2')
depends=('soapysdr')
makedepends=('cmake')
source=("$url/archive/v$pkgver.zip")
sha512sums=('6afc5e99061725a5cab79418ea5a912a9de73d2a5abd5932e17b1ef6b6b4c0c079fd8502dd37ce039244ba2aab692001736f371d2ef1570be6c2fb2ab30f7c72')

build(){
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  cmake .. \
  	-DCMAKE_INSTALL_PREFIX=/usr

  make
}

package()
{
    cd $pkgname-$pkgver/build

    make DESTDIR="$pkgdir" install
}

