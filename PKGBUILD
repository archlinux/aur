# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=connective-index-pages
pkgver=1.0.0

pkgrel=2
pkgdesc="Custom Index Pages module for Connective servers"
arch=( 'any' )
url=""
license=('LGPL3')
groups=( "connective-server" )
depends=( 'java-environment' 'connective-http' )
makedepends=( 'gradle>=6.7' 'cq' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=main.install
changelog=
source=("git+https://aerialworks.ddns.net/ASF/CustomIndexPages.git")
noextract=()
md5sums=('SKIP')

build() {
    cd CustomIndexPages
    chmod +x gradlew createlocalserver.sh
    ./createlocalserver.sh
    gradle build
}

package() {
    cd CustomIndexPages
    
    mkdir -p "$pkgdir/usr/lib/customindexpages"
    mv build/libs/CustomIndexPages-*.jar "$pkgdir/usr/lib/customindexpages/CustomIndexPages.jar"
}
