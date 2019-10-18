# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.0.9
pkgrel=1
pkgdesc="Terminal user interface for Twitch"
url="https://gitlab.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")
changelog="CHANGELOG"

# Dependencies
depends=("jq" "streamlink" "wget")

# Download information
source=("${url}/uploads/e3489943dbea543c0b29bad948e16287/wtwitch-1.0.9.tar.gz" "${url}/uploads/2b33d008b2d455f763747894a236d85b/wtwitch-1.0.9.tar.gz.sig")
validpgpkeys=("0CE6D5B52BD80B4EDB8DF343546BFAE445159FFC")
sha256sums=("38aea0b2e3735291a003ec76e421e50922190e4a9d48d45c4d02f063ba722f3f" "9a12b8598b6ce0ee7ec1ebfdb63b1f60c487df2f912a122fc8b59e21025274e1")

package() {
  cd "${srcdir}"

  # wtwitch "binary"
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}

