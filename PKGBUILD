# Maintainer: emilweth <coucou@emi.cool>
pkgname=eco
pkgver=0.10.0.0
pkgrel=1
pkgdesc="Eco game client"
arch=('x86_64')
url="https://play.eco"
license=("All rights reserved")
source=(
file://EcoLinux_v${pkgver}-beta.zip
eco.desktop
logo.png
)
sha256sums=(
b3b79b6a2ff33a4faed00b374e062a6a57ddf74000d6cc369e452e891fc33d83
9901ff9e70874eada413517cf4d110eae3b5f0353bfa450423c269beb539c4fd
bfa1088a624021b3e47f67f61c40a8dae71672f632ddab6e049669c19e2e9670
)

build() {
  cd "$srcdir"
}

package () {

  cd "$pkgdir"
  
  mkdir -p "opt"

  install -Dm644 "$srcdir/logo.png" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/eco.png"

  install -Dm644 "$srcdir/eco.desktop" "$pkgdir/usr/share/applications/eco.desktop"

  cp -R "$srcdir" "$pkgdir/opt/$pkgname"
  chmod +x "$pkgdir/opt/$pkgname/Eco.x86_64"
  
}
