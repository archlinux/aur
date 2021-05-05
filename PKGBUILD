# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=whitebox-tools
pkgver=1.4.0
pkgrel=1
pkgdesc="WhiteboxTools is an advanced geospatial data analysis platform developed by Prof. John Lindsay"
arch=(i686 x86_64)
url="https://jblindsay.github.io/ghrg/WhiteboxTools/index.html"
license=('MIT')
makedepends=('rust')
depends=('python')
source=("https://github.com/jblindsay/whitebox-tools/archive/${pkgver}.tar.gz")
sha256sums=('87bb232da1988de3ae599f429658c2cfae80b249a564715af0c35b16af743847')

package() {
    cd "${pkgname}-${pkgver}"
    
    cargo install --path . --root="${pkgdir}/usr"  
    rm "${pkgdir}/usr/.crates.toml"
}
