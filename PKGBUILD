# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.0.1
pkgrel=1
pkgdesc="Terminal user interface for Twitch"
url="https://gitlab.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")

# Dependencies
makedepends=("asciidoc")
depends=("bash" "jq" "streamlink" "wget")

# Download information
source=("${url}/uploads/6d9c362d796f36a17f2710fdc9da5260/wtwitch-1.0.1-1.tar.gz" "${url}/uploads/c45b81329b53de5f93e373e07616226b/wtwitch-1.0.1-1.tar.gz.sig")
validpgpkeys=("0CE6D5B52BD80B4EDB8DF343546BFAE445159FFC")
sha256sums=("aaf038bf2afff5690f2f4d07a4f67faa134e72830f337e60290c8bee4b6299a3" "23ac904abe94a00cf316596395d8c92adc53fe3c27cfd314c934e6040ba90b1d")

prepare() {
  # Build manpage from asciidoc
  cd "${srcdir}"
  a2x --format manpage wtwitch.1.adoc
}

package() {
  cd "${srcdir}"

  # wtwitch binary
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}

