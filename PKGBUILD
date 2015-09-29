# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=mimemagic
pkgname=ruby-$_gemname
pkgver=0.3.0
pkgrel=1
pkgdesc='Fast mime detection by extension or content in pure ruby (Uses freedesktop.org.xml shared-mime-info database).'
arch=('any')
url='https://github.com/minad/mimemagic'
license=('MIT')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('a9a1de1e5750b4e59d1126a84dd67ae55595feda835f1659e3fe686917c13480')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
