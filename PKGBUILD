# Maintainer: Junfeng Qiao <qiaojunfeng at outlook.com>
# Contributor:

pkgbase=font-bakoma
pkgname=('otf-bakoma' 'ttf-bakoma')
pkgver=20050616
pkgrel=1
pkgdesc="The CM and AMS fonts distributed by CTAN"
arch=(any)
url='https://www.ctan.org/pkg/bakoma-fonts'
license=(Unlicense)
makedepends=(unzip)
depends=(fontconfig)
provides=(font-bakoma)
source=(
    https://mirrors.ctan.org/fonts/cm/ps-type1/bakoma.zip
    "license.html::https://www.ctan.org/license/other-free"
)
sha256sums=(
    '6fb67f2fdaf5846fe81734d04d69096b847d2b41ca6da7923a9a73437e588734'
    'SKIP'
)

package_otf-bakoma() {
    pkgdesc+=' (OTF)'
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" bakoma/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.html
}

# TTF has less fonts than OTF
package_ttf-bakoma() {
    pkgdesc+=' (TTF)'
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" bakoma/ttf/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.html
}
