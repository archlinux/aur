# Maintainer: emilweth <coucou@emi.cool>
pkgname=eco
pkgver=0.9.2.4
pkgrel=1
pkgdesc="Eco game client"
arch=('x86_64')
url="https://play.eco"
license=("All rights reserved")
source=(
https://s3-us-west-2.amazonaws.com/eco-releases/EcoLinux_v${pkgver}-beta.zip
eco.desktop
logo.png
eco
)
sha256sums=(
b0b41bfdd1d32b42c5bb79e4008cbe256d94dc3da5b523988578527705aba2c4
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
