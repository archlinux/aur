# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=jetbrains-mps
pkgver=3.2.1
pkgrel=2
pkgdesc="JetBrains Meta Programming System"
arch=('any')
url="http://www.jetbrains.com/mps/index.html"
license=('custom: MPS license agreement')
depends=('jdk')
makedepends=('')

source=("http://download.jetbrains.com/mps/32/MPS-${pkgver}.tar.gz")
sha1sums=(
7d70767ba7b796873d455d3689d270959d892a94)

build() {
    cd "${srcdir}"
    echo "#!/bin/sh" > mps
    echo "JDK_HOME=/usr/lib/jvm/java-8-jdk /opt/JetBrains-MPS/mps.sh" >> mps
}

package() {
    install -d "${pkgdir}/opt/"
    mv "${srcdir}/MPS 3.2/" "${pkgdir}/opt/JetBrains-MPS"
    install -m 755 -D "${srcdir}/mps" "${pkgdir}/usr/bin/mps"
}
