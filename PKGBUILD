# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.0.2
pkgrel=1
pkgdesc="Terminal user interface for Twitch"
url="https://gitlab.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")

# Dependencies
depends=("bash" "jq" "streamlink" "wget")

# Download information
source=("${url}/uploads/f8ca485efbff1bd2f23cc19f4b8da036/wtwitch-1.0.2-1.tar.gz" "${url}/uploads/a428ff76227f0a9cdd6c5fc350b9e9b9/wtwitch-1.0.2-1.tar.gz.sig")
validpgpkeys=("0CE6D5B52BD80B4EDB8DF343546BFAE445159FFC")
sha256sums=("d20b3de91608c59a59a6b74f1bbbbdd4eef63a055d74cd134a88325f2a8634d7" "2e3dd155e8ff4999c2e0b67b6f02fd3fa394f9c9d66690956dea4a7856fa9b78")

package() {
  cd "${srcdir}"

  # wtwitch binary
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}

