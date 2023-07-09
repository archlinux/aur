# Maintainer: jdev082 <jdev0894@gmail.com>

pkgname=catalyst-browser-bin
pkgver=3.4.9
pkgrel=1
pkgdesc="Catalyst Web Browser"
arch=('x86_64')
url="https://getcatalyst.eu.org"
license=('MIT')
source=("https://github.com/CatalystDevOrg/Catalyst/releases/download/v3.4.9/catalyst-linux-x64.tar.gz")
md5sums=("a23ac6728ef4e35f6363d03825abbd3d")

package() {
  mkdir -p "$pkgdir/opt/catalyst-browser"
  cp -r "$srcdir/catalyst-linux-x64/." "$pkgdir/opt/catalyst-browser"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/catalyst-browser/catalyst "${pkgdir}/usr/bin/catalyst-browser"
  mkdir -p "$pkgdir/usr/share/applications"
  cp -r "../Catalyst.desktop" "$pkgdir/usr/share/applications"
  cp -r "../catalyst.png" "$pkgdir/opt/catalyst-browser"
}