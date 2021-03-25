# Maintainer: Matthew Stern <msstern98 gmail com>
# Maintainer: Ben Michalowicz <benjaminmichalowicz98 gmail com>

pkgname=topologic-parse-git
pkgbase=topologic-parse-git
pkgver=1.0.0
pkgrel=1
pkgdesc='Library to create dyanimic context free or switching automata'
arch=('any')
url="https://github.com/mstern98/topologic-parse-git"
license=('MIT')
depends=(topologic-git bison flex)
makedepends=(git)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mstern98/topologic-parse-git/archive/v${pkgver}.tar.gz")
sha256sums=('defa59e0469d44866b0446e0ed9a5eaf0d4dfb887e530ffb98872c09639e7f51')

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
