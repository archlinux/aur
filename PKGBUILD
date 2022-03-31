# Maintainer: Lucas Rooyakkers <lucas rooyakkers @ pm me>
pkgname=mascii
pkgver=2.0.0
pkgrel=1
pkgdesc="This is source code for the Musical Ascii (\"Mascii\") polyphonic text-based music notation system."
arch=('any')
url="https://github.com/arikast/mascii-quickstart"
license=('MIT')
depends=('java-runtime')
provides=('mascii')
source=("https://github.com/arikast/mascii-quickstart/raw/master/bin/${pkgname}-${pkgver}.jar")
md5sums=('76ceb43b151383c792134f872ba0cae0') 

package() {
    install -Dm755 "${pkgname}-${pkgver}.jar" "$pkgdir/usr/bin/mascii.jar"

    echo '#!/bin/bash
java -jar /usr/bin/mascii.jar "$@"' > "$pkgdir/usr/bin/mascii"

    chmod 0755 "$pkgdir/usr/bin/mascii"
}
