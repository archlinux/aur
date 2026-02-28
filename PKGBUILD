# Maintainer: tobast <contact at tobast dot fr>

pkgname=choria-cm
pkgver=0.0.18
pkgrel=1
pkgdesc="Choria Configuration Management"
arch=('any')
url="https://github.com/choria-io/ccm"
license=('Apache-2.0')
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v0.0.18.tar.gz")
sha256sums=('6dffe20a48f15e5f100ca969075da02624dc51b86072ba339ab7dc23c0a1ebae')

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
