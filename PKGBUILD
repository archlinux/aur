# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=firefox-searchengine-ddgfr
pkgver=0.2
pkgrel=1
pkgdesc="Firefox french DuckDuckGo search engine"
arch=('any')
url="http://duckduckgo.com/"
license=('GPL')
depends=("firefox")
source=(ddg-fr.xml
        ddg-en.xml)
md5sums=('c7d714ed5be56908169f7c1f16e90eb0'
         '485e3f3233cf93ea2d60ccc288e3488e')

package() {
  cd "${srcdir}"
  local _prefix="${pkgdir}"/usr/lib/firefox/distribution/searchplugins/common

  for i in ${source[@]}; do
    install -D -m 0644 "${srcdir}"/$i ${_prefix}/$i
  done
}