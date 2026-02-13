# Maintainer: tobast <contact at tobast dot fr>

pkgname=choria-cm
pkgver=0.0.17
pkgrel=1
pkgdesc="Choria Configuration Management"
arch=('any')
url="https://github.com/choria-io/ccm"
license=('Apache-2.0')
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v0.0.17.tar.gz")
sha256sums=('c94b5c326ebd5369119e071c15084da51ef0c32be3acfea7357d4101e9bb5115')

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
