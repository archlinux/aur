# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-rse
pkgver=3.5
_pkgdate=201305311734
pkgrel=3
pkgdesc="Manage remote projects in Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dsdp/tm/"
license=('EPL')
depends=("eclipse>=3.4")
optdepends=('openssh')
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/tm/downloads/drops/R-${pkgver}GA-$_pkgdate/RSE-runtime-${pkgver}-GA.zip"
	"$_mirror/tm/downloads/drops/R-${pkgver}GA-$_pkgdate/RSE-useractions-${pkgver}-GA.zip"
	"$_mirror/tm/downloads/drops/R-${pkgver}GA-$_pkgdate/TM-terminal-${pkgver}-GA.zip")
md5sums=('9d99c20b3521b9ee234f0d7853a11f7b'
         'eb445e154c589fdc1ec8a4a9cdb5538f'
         '1a30d8fb8e38dd9f71ba57e58e50ce7e')

package() {
    _dest=$pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/eclipse
    cd $srcdir
    install -d "${_dest}"
    cp -a eclipse/features "${_dest}"
    cp -a eclipse/plugins "${_dest}"
}
