# Maintainer: spyflow <https://github.com/spyflow>
pkgname=obattery
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple linux battery check percentage calculator written in C"
arch=('x86_64' 'aarch64')
url="https://github.com/spyflow/oBattery"
license=('GPL-3.0-or-later')
keywords=('battery' 'percentage' 'calculator' 'cli' 'utilities' 'sysfs' 'power' 'laptop')
depends=('glibc')
makedepends=('gcc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a6b441f033eb2e64a94eacd6b5c9c09ad570c51c282720568885f51657001c44')

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
