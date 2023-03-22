# Maintainer: Emma Tebibyte <emma@tebibyte.media>

pkgname="xdg-sanity"
pkgver=0.4.0
pkgrel=1
pkgdesc="A tool to sanely open http/s links."
arch=("any")
url="https://git.tebibyte.media/emma/xdg-sanity"
license=("AGPL3")
source=("https://git.tebibyte.media/emma/xdg-sanity/archive/0.4.0.tar.gz")
backup=("etc/xdg-sanity/xdg-sanity.conf")
depends=("handlr")
makedepends=("git" "gendesk")
provides=("xdg-sanity")

sha256sums=("SKIP")

prepare() {
  cd ..
  gendesk -n --categories="Network;WebBrowser" \
    --exec="xdg-sanity %U" \
    --genericname="Web Browser" \
    --icon="browser" \
    --mimetypes="text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;application/x-xpinstall" \
    PKGBUILD
  mv xdg-sanity.desktop "${srcdir}"
}

package() {
  cd $srcdir
  install -D ${pkgname}/xdg-sanity ${pkgdir}/usr/bin/xdg-sanity
  install -D xdg-sanity.desktop ${pkgdir}/usr/share/applications/xdg-sanity.desktop
}
