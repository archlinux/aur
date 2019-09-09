# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.0.5
pkgrel=1
pkgdesc="Terminal user interface for Twitch"
url="https://gitlab.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")

# Dependencies
depends=("bash" "coreutils" "jq" "streamlink" "wget")

# Download information
source=("${url}/uploads/6d52402cbb151c9610394db7048dc4a1/wtwitch-1.0.5.tar.gz" "${url}/uploads/1b7700be69b939ac706ed6cf91d3c241/wtwitch-1.0.5.tar.gz.sig")
validpgpkeys=("0CE6D5B52BD80B4EDB8DF343546BFAE445159FFC")
sha256sums=("96e65705e7ad46543472e8968f81e64ba196b231d6822ecd21dfd58551ddfd11" "60c3326facea41530dd2c74d768d9833784381838c2e4ca281f2ed5f0fbbfe9a")

package() {
  cd "${srcdir}"

  # wtwitch binary
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}

