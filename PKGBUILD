# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=whitebox-tools
pkgver=1.1.0
pkgrel=1
pkgdesc="WhiteboxTools is an advanced geospatial data analysis platform developed by Prof. John Lindsay"
arch=(i686 x86_64)
url="https://jblindsay.github.io/ghrg/WhiteboxTools/index.html"
license=('MIT')
makedepends=('rust')
depends=('python')
source=("https://github.com/jblindsay/whitebox-tools/archive/v${pkgver}.tar.gz")
sha256sums=('bc0cdb39a4dc15763cab020e3970263e0bb969a9c64fdb4018c916fd925fc364')


package() {
    cd "${pkgname}-${pkgver}"
    
    cargo install --path . --root="${pkgdir}/usr"  
    rm "${pkgdir}/usr/.crates.toml"
}