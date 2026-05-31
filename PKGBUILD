# Maintainer: spyflow <https://github.com/spyflow>
pkgname=obattery
pkgver=0.0.2b
pkgrel=1
pkgdesc="Simple linux battery check percentage calculator written in C"
arch=('x86_64' 'aarch64')
url="https://github.com/spyflow/oBattery"
license=('GPL-3.0-or-later')
keywords=('battery' 'percentage' 'calculator' 'cli' 'utilities' 'sysfs' 'power' 'laptop')
depends=('glibc')
makedepends=('gcc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('772750c0c1b819e654546e40e303aa6b79ca9fe96e974bb4b0bced8c1eb6ca5d')

build() {
    cd "oBattery-${pkgver}"
    gcc code.c -O2 -o obattery
}

package() {
    cd "oBattery-${pkgver}"
    install -Dm755 obattery "${pkgdir}/usr/bin/obattery"
    
    # Instala el archivo de licencia GPLv3 en el directorio correcto de Arch
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
