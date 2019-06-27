# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.0.3
pkgrel=1
pkgdesc="Terminal user interface for Twitch"
url="https://gitlab.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")

# Dependencies
depends=("bash" "jq" "streamlink" "wget")

# Download information
source=("${url}/uploads/15da515f8c963c28b7d88cd4dd45f300/wtwitch-1.0.3-1.tar.gz" "${url}/uploads/561845c4957b2b9b987033b3c9be9181/wtwitch-1.0.3-1.tar.gz.sig")
validpgpkeys=("0CE6D5B52BD80B4EDB8DF343546BFAE445159FFC")
sha256sums=("f89f913eca8991b27c1f1878ba66f4cd2a7019adcba1c75d25bcd43c40ce4c51" "1405b8a0fa4eca71f53aeb95f9fc8526ede5d0ceea42fe619af09674c406057d")

package() {
  cd "${srcdir}"

  # wtwitch binary
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}

