# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.0.7
pkgrel=1
pkgdesc="Terminal user interface for Twitch"
url="https://gitlab.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")

# Dependencies
depends=("jq" "streamlink" "wget")

# Download information
source=("${url}/uploads/4eb4d1efc7b79cd606f5a2ef77ea6a12/wtwitch-1.0.7.tar.gz" "${url}/uploads/21539c02b5f10c7fef07a04d35a819dd/wtwitch-1.0.7.tar.gz.sig")
validpgpkeys=("0CE6D5B52BD80B4EDB8DF343546BFAE445159FFC")
sha256sums=("a5bf1285cf5667295a7acf7cac25dfb1d5bd81856846dfdb515fbb58e5054369" "08c30eac93c283eacd3837abfaf12287b52b317c860530fff2bcb6c022eda2f0")

package() {
  cd "${srcdir}"

  # wtwitch "binary"
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}

