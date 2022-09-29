# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>

_pkgname=gnome-shell-extension-duckduckgo-search-provider
pkgname=$_pkgname-git
pkgver=r9.1e87ab1
pkgrel=1
pkgdesc="Add DuckDuckGo search suggestions to Gnome Shell Search"
arch=('any')
url="https://github.com/keithamus/gnome-shell-duckduckgo-search-provider"
license=('GPL-2')
depends=('gnome-shell')
makedepends=('typescript')
optdepends=(
  'firefox: opening DuckDuckGo in Firefox'
  'chromium: opening DuckDuckGo in Chromium'
  'epiphany: opening DuckDuckGo in Epiphany'
)
source=(git+https://github.com/keithamus/gnome-shell-duckduckgo-search-provider)
sha256sums=('SKIP')

_gitsrcdir=gnome-shell-duckduckgo-search-provider

pkgver() {
  cd "$_gitsrcdir"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitsrcdir
  make
}

package() {
  cd $_gitsrcdir
  make DESTDIR="$pkgdir" install
}
