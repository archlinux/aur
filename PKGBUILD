# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: scippio <scippio@berounet.cz>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>

pkgname=eclipse-pdt
_pkgver=3.4.0
_reltag=201502171754
pkgver=${_pkgver}_${_reltag}
pkgrel=1
pkgdesc="PHP Development Tools for Eclipse"
arch=('any')
url="http://www.eclipse.org/pdt/"
license=('EPL')
depends=('eclipse-dltk-core' 'eclipse-dtp' 'eclipse-wtp')
optdepends=('eclipse-rse: For remote projects' 'php: The interpreter' 'xdebug: Better debug experience')
makedepends=('unzip')
install=eclipse-pdt.install
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/tools/pdt/downloads/pdt-Update-${_pkgver}.${_reltag}.zip")
noextract=("pdt-Update-${_pkgver}.${_reltag}.zip")

sha256sums=('fc5c7d9f9ffafdd3e00a2a520e7c23c51bcebe8cb2da0a661ca9c071313a1b1e')

prepare() {
    unzip pdt-Update-${_pkgver}.${_reltag}.zip || true
}
build() {
  true
}

package() {
    # temporary workaround
    _pkgver="3.4"
    _installdir="$pkgdir/usr/share/eclipse/dropins/pdt"
    cd "$srcdir/$_pkgver"
    install -d "$_installdir/eclipse"
    cp -a features "$_installdir/eclipse"
    cp -a plugins "$_installdir/eclipse"
}
