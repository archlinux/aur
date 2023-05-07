# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=tt-rss-plugin-af-readability-git
pkgver=r2.cdc97d8
pkgrel=1
pkgdesc="Readability plugin for tt-rss"
arch=('any')
url="https://gitlab.tt-rss.org/tt-rss/plugins/ttrss-af-readability"
license=('GPL3')
depends=('tt-rss')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd ttrss-af-readability
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd ttrss-af-readability
  _instdir="$pkgdir"/usr/share/webapps/tt-rss/plugins/af_readability

  install -d "$_instdir"
  cp -ra * "$_instdir/"
}
