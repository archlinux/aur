# Maintainer: soymadip 
pkgname=autotitle
pkgver=1.7.0
pkgrel=1
pkgdesc="Automated media file renamer using online databases"
arch=('x86_64' 'aarch64')
url="https://github.com/mydehq/autotitle"
license=('GPL3')
depends=('glibc')

source_x86_64=("${pkgname}-linux-amd64::${url}/releases/download/v${pkgver}/${pkgname}-linux-amd64")
source_aarch64=("${pkgname}-linux-arm64::${url}/releases/download/v${pkgver}/${pkgname}-linux-arm64")

source=("${url}/raw/v${pkgver}/src/config.yml"
        "${url}/raw/v${pkgver}/LICENSE"
        "${url}/raw/v${pkgver}/README.md")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

backup=('etc/autotitle/config.yml')

package() {
    local _bin_file="${pkgname}-linux-amd64"
    [ "$CARCH" == "aarch64" ] && _bin_file="${pkgname}-linux-arm64"

    install -Dm755 "$_bin_file" "$pkgdir/usr/bin/autotitle"
    install -Dm644 "config.yml" "$pkgdir/etc/autotitle/config.yml"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
