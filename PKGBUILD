# Maintainer: Jakob Matthes <jakob.matthes@gmail.com>
pkgname=mayday
pkgver=2.30
pkgrel=1
pkgdesc="A workbench for visualization, analysis and storage of microarray data."
arch=('any')
url="http://it.inf.uni-tuebingen.de/?page_id=248"
license=('GPL')
groups=()
depends=('java-runtime')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="${pkgname}.install"
changelog=
source=("http://it.informatik.uni-tuebingen.de/software/${pkgname}/${pkgname}-${pkgver}/${pkgname^}-${pkgver}.zip"
        "mayday"
        "mayday.desktop")
noextract=()
md5sums=('338f0ca3c633814ee11e8be530447d64'
         'd3b494541b7da3c7840c91e9072fbde2'
         '67e0901b1ec823f21f1e6673f5783ec3')
validpgpkeys=()

package() {
  install -dm755 $pkgdir/usr/share/java/mayday

  # plugins directory
  install -dm755 $pkgdir/usr/share/java/mayday/plugins
  cp ${pkgname^}/plugins/* $pkgdir/usr/share/java/mayday/plugins/
  chmod 644 $pkgdir/usr/share/java/mayday/plugins/*

  # start script
  install -Dm755 mayday $pkgdir/usr/bin/mayday

  # desktop file
  install -Dm755 mayday.desktop "$pkgdir/usr/share/applications/mayday.desktop"
}
