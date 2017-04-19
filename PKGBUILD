# Maintainer: Alexander Polovtcev <alex.polovtcev at gmail dot com>
# Contributor: Tony Sweets <tony.sweets@gmail.com>
# Contributor: Valentin-Costel Hăloiu <vially.ichb@gmail.com> (Maintainer Glassfish v3)
# Contributor: Bernhard Friedreich <friesoft@gmail.com> (maintainer v3)
# Contributor: aleph (rc script v3)
# Contributor: coverslide (new version v3)
# Contributor: andrej (new pkgbuild v3)
# Contributor: xtecuan (config v3)
# Contributor: Thief_hu (rc script fix v3)
# Contributor: Simon Tunnat (systemd service file v3)

pkgname=glassfish-v4
pkgver=4.1.2
pkgrel=1
pkgdesc="GlassFish 4 is a Java EE 7 open source application server"
url="http://glassfish.java.net/"
license=("CDDL")
provides=("glassfish")
conflicts=("glassfish")
depends=("java-environment>=7")
arch=("any")
options=(!strip)
source=(
    http://download.java.net/glassfish/${pkgver}/release/glassfish-${pkgver}.zip
    glassfish.service
)

sha256sums=('68d5c0d95152a07e68e9b00535b11e7b8727646eb8bca05f918abdadebac7266'
            '46f60ff39231a62c39131ff6c04ff1196f147e810a500f02d9505b7327285de8')

package() {
    mkdir -p $pkgdir/opt
    mv glassfish4 $pkgdir/opt/
    install -D $srcdir/glassfish.service $pkgdir/usr/lib/systemd/system/glassfish.service
}
