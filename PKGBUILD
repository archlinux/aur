# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=whitebox-tools
pkgver=1.0.2
pkgrel=1
pkgdesc="WhiteboxTools is an advanced geospatial data analysis platform developed by Prof. John Lindsay"
arch=(i686 x86_64)
url="https://jblindsay.github.io/ghrg/WhiteboxTools/index.html"
license=('MIT')
makedepends=('rust')
depends=('python')
source=("https://github.com/jblindsay/whitebox-tools/archive/v${pkgver}.tar.gz")
sha256sums=('d53dd8a8390f4d0883b5d66d776cc20418802f9fae48f80bd817da14d03c22cf')


package() {
    cd "${pkgname}-${pkgver}"
    
    cargo install --path . --root="${pkgdir}/usr"  
    rm "${pkgdir}/usr/.crates.toml"
}