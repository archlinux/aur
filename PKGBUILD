# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=firefox-extension-remove-google-search-redirects
pkgver=1.3.1
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en-us/firefox/addon/google-no-tracking-url/"
pkgdesc="Removes google's redirection and turns every search result in its original link."
license=('MPL')
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/371815/remove_google_search_redirects-1.3.1-fx.xpi")

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  rm *.xpi
  mv * $dstdir
}
sha256sums=('e72e03f414e63a65b07ad91b5a256bcb84703609ff742b2f03d467bb5be8cb91')
