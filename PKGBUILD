# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.0.8
pkgrel=1
pkgdesc="Terminal user interface for Twitch"
url="https://gitlab.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")
changelog="CHANGELOG"

# Dependencies
depends=("jq" "streamlink" "wget")

# Download information
source=("${url}/uploads/13fe183ed6a9000243c99dde0a6ee980/wtwitch-1.0.8.tar.gz" "${url}/uploads/fd41056f9dbebf32bcab87a9e898ce27/wtwitch-1.0.8.tar.gz.sig")
validpgpkeys=("0CE6D5B52BD80B4EDB8DF343546BFAE445159FFC")
sha256sums=("32c94cf7ec71fbe0dcaf29bbd04fd4fba6e7e68da268b58c458b18560ae18f94" "0c8218c2b45cdc463c85deae0a9e5f3ace0f17cf24292722e22abaddb1d2db77")

package() {
  cd "${srcdir}"

  # wtwitch "binary"
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}

