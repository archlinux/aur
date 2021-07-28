# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=connective-php
pkgver=1.0.0

pkgrel=4
pkgdesc="ConnectivePHP -- PHP support module for ConnectiveHTTP"
arch=( 'any' )
url=""
license=('LGPL3')
groups=( "connective-server" )
depends=( 'java-environment' 'connective-http' 'php-cgi' )
makedepends=( 'gradle>=6.7' 'cq' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=main.install
changelog=
source=("git+https://aerialworks.ddns.net/ASF/ConnectivePHP.git")
noextract=()
md5sums=('SKIP')

build() {
    cd ConnectivePHP
    chmod +x gradlew createlocalserver.sh
    ./createlocalserver.sh
    gradle build
}

package() {
    cd ConnectivePHP
    
    mkdir -p "$pkgdir/usr/lib/connective-php"    
    mv build/libs/ConnectivePHP-*.jar "$pkgdir/usr/lib/connective-php/ConnectivePHP.jar"
}
