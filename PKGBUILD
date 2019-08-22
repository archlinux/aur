# Maintainer: Hunter Peavey < vrywjvgviuotxeioqipx at disroot dot org >

# General package information
pkgname=wtwitch
pkgver=1.0.4
pkgrel=2
pkgdesc="Terminal user interface for Twitch"
url="https://gitlab.com/krathalan/wtwitch"
license=("GPL3")
arch=("any")

# Dependencies
depends=("bash" "coreutils" "jq" "streamlink" "wget")

# Download information
source=("${url}/uploads/94504f151ec932231ac934dba4ea6379/wtwitch-1.0.4.tar.gz" "${url}/uploads/c5a6bbadafd76e5ddd59f5cf85c7cc05/wtwitch-1.0.4.tar.gz.sig")
validpgpkeys=("0CE6D5B52BD80B4EDB8DF343546BFAE445159FFC")
sha256sums=("9189137b49f83967aa67b8e888522a1794aa33748fd5869ae3d059eead26b05c" "dbec4bdc35b3cb8fe85c29cb35c3d82e12c1df843fb2574caf7844c2b7388e29")

package() {
  cd "${srcdir}"

  # wtwitch binary
  install -D -m755 wtwitch "${pkgdir}/usr/bin/${pkgname}"

  # man page
  install -D -m644 wtwitch.1 "${pkgdir}/usr/share/man/man1/wtwitch.1"
}

