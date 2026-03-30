pkgname=sfptool-bin
pkgver=0.9.4
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_0.9.4_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_0.9.4_amd64.deb")
sha256sums=('d307c97093862423e705aba6a085bca69ebb17b0f89718088cd47c063ed52a77')

package() {
  cd "$srcdir"
  local data_archive
  data_archive="$(bsdtar -tf "sfp-tool_0.9.4_amd64.deb" | grep '^data.tar\.' | head -n1)"
  bsdtar -xOf "sfp-tool_0.9.4_amd64.deb" "$data_archive" | bsdtar -xf - -C "$pkgdir"
}
