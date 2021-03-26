# Maintainer: Matthew Stern <msstern98 gmail com>
# Maintainer: Ben Michalowicz <benjaminmichalowicz98 gmail com>

pkgname=topologic-parse-git
pkgbase=topologic-parse-git
pkgver=1.1.0
pkgrel=1
pkgdesc='Library to create dyanimic context free or switching automata'
arch=('any')
url="https://github.com/mstern98/topologic-parse-git"
license=('MIT')
depends=(topologic-git bison flex)
makedepends=(git)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mstern98/topologic-parse-git/archive/v${pkgver}.tar.gz")
sha256sums=('17b8facf6c7dab63f36553bb139602af79e2420aa44490cc836130314bacfe36')

build() 
{
    cd "$srcdir/${pkgname}-${pkgver}"
    echo "Starting Build..."
    make
}

package()
{
    mkdir -p "$pkgdir/usr/lib"
    
    cp "$srcdir/${pkgname}-${pkgver}/libtopologic_parse.a" "$pkgdir/usr/lib/"
}
