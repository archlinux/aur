# Maintainer: soymadip 
pkgname=autotitle
pkgver=1.4.0
pkgrel=1
pkgdesc="Automated media file renamer using online databases"
arch=('x86_64')
url="https://github.com/mydehq/autotitle"
license=('GPL3')
depends=('glibc')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname}-linux-amd64"
        "${url}/raw/v${pkgver}/src/config.yml"
        "${url}/raw/v${pkgver}/LICENSE"
        "${url}/raw/v${pkgver}/README.md")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
backup=('etc/autotitle/config.yml')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/autotitle"
    install -Dm644 "config.yml" "$pkgdir/etc/autotitle/config.yml"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
