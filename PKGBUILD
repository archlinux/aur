# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.0.6
pkgrel=2
pkgdesc="Terminal user interface for Twitch"
url="https://gitlab.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")

# Dependencies
depends=("jq" "streamlink" "wget")

# Download information
source=("${url}/uploads/5fe145dfe14685f3e7d1fbc043bae95b/wtwitch-1.0.6.tar.gz" "${url}/uploads/b48b3727617cfbba25df42343feecba0/wtwitch-1.0.6.tar.gz.sig")
validpgpkeys=("0CE6D5B52BD80B4EDB8DF343546BFAE445159FFC")
sha256sums=("0efcbaf322e005d1c918e124c52dd9e1ad8a7428f6c8066197e7ff1b848c02d0" "e7613cbaa129b392e839158b1daaea972d2961389ff7fb59a51ff6e2d6d8b792")

package() {
  cd "${srcdir}"

  # wtwitch "binary"
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}

