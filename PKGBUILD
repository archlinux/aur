# Maintainer: tobast <contact at tobast dot fr>

pkgname=choria-cm
pkgver=0.0.19
pkgrel=1
pkgdesc="Choria Configuration Management"
arch=('any')
url="https://github.com/choria-io/ccm"
license=('Apache-2.0')
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('251ac9d05880317b53f78d893b300e282d1e44f3d489945a313255e1228b680c')

_archive_name='ccm'

build() {
    cd "$srcdir/${_archive_name}-${pkgver}"
	go build -o ccm ./cmd
}

package() {
    cd "$srcdir/${_archive_name}-${pkgver}"

    install -D -m644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 "./ccm" "$pkgdir/usr/bin/ccm"
}
