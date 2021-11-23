# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=downlords-faf-client
pkgver=2021.10.0
_pkgver="${pkgver//./_}"
_filename="dfc_unix_${_pkgver}.tar.gz"
pkgrel=1
epoch=1
pkgdesc="Forged Alliance Forever - Lobby Client. Community-driven client system for Supreme Commander: Forged Alliance. Downlord's Java client reimplementation."
url="http://www.faforever.com/"
arch=('any')
license=('MIT')
groups=()
checkdepends=()
optdepends=()
depends=('jdk15-adoptopenjdk')
makedepends=('jq')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/FAForever/downlords-faf-client/releases/download/v$pkgver/$_filename" "https://github.com/FAForever/downlords-faf-client/raw/develop/src/media/appicon/128.png" 'DownlordsFafClient.desktop' 'downlords-faf-client')
sha256sums=('9c49aab5c21dbe9b7a49fe0eca3310407147a002f0e9e3ccbae5faec36e196c5'
            '2a5803ca2dd463aa4b53d79cff7f30e3aa7beb0d874b39c8ef59e679fbde9d3d'
            '3fd2b21da9de9f9c02dd89ee07f49c559dbb2de15f4e86a9b31f6353f608ffa6'
            'a5af2923259f065c9993f8c90302ce55825bf61d7f0ce9e86830267ed63be56e')
noextract=()
validpgpkeys=()

package() {
  mkdir -p $pkgdir/usr/share/java
  tar xfv $_filename -C $pkgdir/usr/share/java
  _subdir="faf-client-${pkgver}"
  mv $pkgdir/usr/share/java/$_subdir $pkgdir/usr/share/java/downlords-faf-client
  install -D "$srcdir/DownlordsFafClient.desktop" "$pkgdir/usr/share/applications/DownlordsFafClient.desktop"
  install -D "$srcdir/downlords-faf-client" "$pkgdir/usr/bin/downlords-faf-client"
  install -D "$srcdir/128.png" "$pkgdir/usr/share/java/downlords-faf-client/icon.png"
  chmod +x "$pkgdir/usr/share/java/downlords-faf-client/natives/faf-uid"
}
