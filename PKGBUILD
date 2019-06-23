# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.0.1
pkgrel=2
pkgdesc="Terminal user interface for Twitch"
url="https://gitlab.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")

# Dependencies
depends=("bash" "jq" "streamlink" "wget")

# Download information
source=("${url}/uploads/ba91a9075897c67e025eb846c1e9832a/wtwitch-1.0.1-2.tar.gz" "${url}/uploads/33e4c2515005eeca2f1901a0b41b6f68/wtwitch-1.0.1-2.tar.gz.sig")
validpgpkeys=("0CE6D5B52BD80B4EDB8DF343546BFAE445159FFC")
sha256sums=("c3f948207b4f68300d03e0b14085fc628c8eeb4f32e7c28e77a941be27b93a7e" "25ad51a9f8d7cb71a0dd2b81ddf8b688265451da46788e25fc2b7cbdc0c9288c")

package() {
  cd "${srcdir}"

  # wtwitch binary
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}

