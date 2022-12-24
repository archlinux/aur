# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=tt-rss-plugin-af-readablity-git
pkgver=r1.0226e0c
pkgrel=1
pkgdesc="Readability plugin for tt-rss"
arch=('any')
url="https://dev.tt-rss.org/tt-rss/ttrss-af-readability"
license=('GPL3')
depends=('tt-rss')
makedepends=('git')
source=("git+https://dev.tt-rss.org/tt-rss/ttrss-af-readability.git")
sha256sums=('SKIP')

pkgver() {
    cd ttrss-af-readability
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ttrss-af-readability
  _instdir="$pkgdir"/usr/share/webapps/tt-rss/plugins/af_readability

  install -d "$_instdir"
  cp -ra * "$_instdir/"
}
