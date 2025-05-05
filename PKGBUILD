# Maintainer: JisuWoniu <jswn@jswn9945.xyz>
pkgbase="ttf-zed-plex-git"
pkgname=("ttf-zed-plex-sans-git" "ttf-zed-plex-mono-git")
pkgver=1.2.1.r17.g5b1ccf6
pkgrel=1
pkgdesc="A fork of IBM Flex with ligatures added."
arch=("any")
url="https://github.com/zed-industries/zed-fonts/tree/zed-plex"
license=("OFL")
source=("git+https://github.com/zed-industries/zed-fonts.git#branch=zed-plex")
sha256sums=('SKIP')

pkgver() {
  cd zed-fonts
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_ttf-zed-plex-sans-git() {
  cd zed-fonts/zed-plex
  install -Dm644 ZedPlexSans-*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  # shellcheck disable=SC2128
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-zed-plex-mono-git() {
  cd zed-fonts/zed-plex
  install -Dm644 ZedPlexMono-*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  # shellcheck disable=SC2128
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
