# Maintainer: ra1nb0w <rainbow@irh.it>

pkgname=gtkterm
pkgver=1.3.1
pkgrel=1
pkgdesc="A gtk+ based serial port communication program"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Jeija/gtkterm"
license=('GPL3')
depends=('gtk3' 'vte3' 'libgudev')
makedepends=('meson' 'ninja')
conflicts=('gtkterm')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('47e39011067ccaa5e965308225d8f80ea4e1793ca884d7f32600fa1fb9ae6628')
install="${pkgname}.install"

build()
{
    cd "${pkgname}-${pkgver}"
    meson --prefix=/usr --buildtype=plain build
    meson compile -C build
}

package()
{
    cd "${pkgname}-${pkgver}"
    meson install -C build --destdir "$pkgdir"
}


