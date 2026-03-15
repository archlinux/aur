pkgname=sfptool-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('custom:unlicensed')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('sfptool')
conflicts=('sfptool')
source=("sfp-tool_0.9.3_amd64.deb::https://s3.jonasled.de/sfp-tool/linux/x86_64/sfp-tool_0.9.3_amd64.deb")
sha256sums=('bb12a78b530285b2ea0d20c3976afcff353d251388071444ef61ad6afebfe992')

package() {
  cd "$srcdir"
  local data_archive
  data_archive="$(bsdtar -tf "sfp-tool_0.9.3_amd64.deb" | grep '^data.tar\.' | head -n1)"
  bsdtar -xOf "sfp-tool_0.9.3_amd64.deb" "$data_archive" | bsdtar -xf - -C "$pkgdir"
}
