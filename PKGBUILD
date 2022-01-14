# Maintainer: emilweth <coucou@emi.cool>
pkgname=eco
pkgver=0.9.4.5
pkgrel=1
pkgdesc="Eco game client"
arch=('x86_64')
url="https://play.eco"
license=("All rights reserved")
source=(
file://EcoLinux_v${pkgver}-beta.zip
eco.desktop
logo.png
eco
)
sha256sums=(
6ec2c843d3925f06a26820e36535317f414acf04dd036c5758b61bd1db5bbb2d
9901ff9e70874eada413517cf4d110eae3b5f0353bfa450423c269beb539c4fd
bfa1088a624021b3e47f67f61c40a8dae71672f632ddab6e049669c19e2e9670
e515f8816f77351fbec9e6ac5e0f5b71d987243dc24692cce36d2c0a9c82c9e3
)

build() {
  cd "$srcdir"
}

package () {

  cd "$pkgdir"
  
  mkdir -p "opt"
  mkdir -p "usr/bin"

  install -Dm644 "$srcdir/logo.png" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/eco.png"

  install -Dm644 "$srcdir/eco.desktop" "$pkgdir/usr/share/applications/eco.desktop"

  install -Dm755 "$srcdir/eco" "$pkgdir/usr/bin/$pkgname"

  cp -R "$srcdir" "$pkgdir/opt/$pkgname"
  chmod +x "$pkgdir/opt/$pkgname/Eco.x86_64"
  
}
