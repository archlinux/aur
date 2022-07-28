# Maintainer: ra1nb0w <rainbow@irh.it>

pkgname=gtkterm
pkgver=1.2.1
pkgrel=1
pkgdesc="A gtk+ based serial port communication program"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Jeija/gtkterm"
license=('GPL3')
depends=('gtk3' 'vte3' 'libgudev')
makedepends=('meson' 'ninja')
conflicts=('gtkterm')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bdd32ffba99348f0fe7f0e227a73f48f9f199ddcf9b38d962c4c674308847b66')
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


