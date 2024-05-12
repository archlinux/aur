# Maintainer: Braulio Oliveira <brauliobo@gmail.com>

gemname=fugit
pkgname=ruby-fugit
pkgver=1.11.0
pkgrel=1
pkgdesc="Time tools for flor and the floraison project"
arch=('any')
url="https://github.com/floraison/fugit"
license=('MIT')
depends=('ruby')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha256sums=('addc9cd3031611921d1dbac094de3a645bc8858828639fd035c9cedd3b460bb9')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${gemname}-${pkgver}.gem"
  rm "$pkgdir/$_gemdir/cache/${gemname}-${pkgver}.gem"
}

