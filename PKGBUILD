# Maintainer: bitscoper <bitscoper@gmail.com>

pkgname=bitscoper-cyber-toolbox-bin
pkgver=8.0.2
pkgrel=1
pkgdesc="A Flutter application consisting of TCP Port Scanner, Route Tracer, File Hash Calculator, String Encoder, Series URI Crawler, DNS Record Retriever, and WHOIS Retriever."
arch=('x86_64')
url="https://github.com/bitscoper/Bitscoper_Cyber_ToolBox/"
license=('GPL3')
depends=('gtk3')
makedepends=('jq' 'unzip')
source=("Linux_x64_Executable.zip::$(curl -s https://api.github.com/repos/bitscoper/Bitscoper_Cyber_ToolBox/releases/latest | jq -r '.assets[] | select(.name | contains("Linux_x64_Executable.zip")) | .browser_download_url' || echo 'Not found!')")
sha256sums=('SKIP')

package() {
  install -dm755 "$pkgdir/opt/Bitscoper_Cyber_ToolBox/"
  install -Dm755 "$srcdir/Linux_x64_Executable/Bitscoper_Cyber_ToolBox" "$pkgdir/opt/Bitscoper_Cyber_ToolBox/"

  install -dm755 "$pkgdir/opt/Bitscoper_Cyber_ToolBox/lib/"
  cp -r "$srcdir/Linux_x64_Executable/lib/"* "$pkgdir/opt/Bitscoper_Cyber_ToolBox/lib/"

  install -dm755 "$pkgdir/opt/Bitscoper_Cyber_ToolBox/data/"
  cp -r "$srcdir/Linux_x64_Executable/data/"* "$pkgdir/opt/Bitscoper_Cyber_ToolBox/data/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/Bitscoper_Cyber_ToolBox/Bitscoper_Cyber_ToolBox" "$pkgdir/usr/bin/Bitscoper_Cyber_ToolBox"
}