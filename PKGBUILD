pkgname=sfptool-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_1.0.0_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_1.0.0_amd64.deb")
sha256sums=('11d86a25d049ef7c8175ed7ec8f4022438180c84e5e9d1fdd51306e5fccbda5c')

package() {
  cd "$srcdir"
  local data_archive
  data_archive="$(bsdtar -tf "sfp-tool_1.0.0_amd64.deb" | grep '^data.tar\.' | head -n1)"
  bsdtar -xOf "sfp-tool_1.0.0_amd64.deb" "$data_archive" | bsdtar -xf - -C "$pkgdir"
}
