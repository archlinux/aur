# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

pkgname=x11clone
pkgver=1.8.80.3
pkgrel=1
pkgdesc='View and interact with another X11 server. Can be used in conjunction with ThinLinc.'
arch=(x86_64)
url='https://github.com/x11clone/x11clone'
license=(GPL2)

depends=(zlib hicolor-icon-theme libxfixes)

source=("https://github.com/x11clone/x11clone/releases/download/v$pkgver/x11clone-Linux-$CARCH-$pkgver.tar.gz")
sha256sums=(261c5454f0a17fd4e04736e55175c5956a87ccf5b19e8135ceb529247cd640e7)

build() {
  # Do not install in /usr/local
  if [ -d usr/local ]; then
    cp -R usr/local/* usr
    rm -rf usr/local
  fi

  # Fix empty dirs
  rmdir usr/man{/man1,} || true
}

package() {
  cp -R "$srcdir/usr" "$pkgdir"
}
