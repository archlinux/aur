# Maintainer: Braulio Oliveira <brauliobo@gmail.com>

gemname=et-orbi
pkgname=ruby-et-orbi
pkgver=1.2.11
pkgrel=1
pkgdesc="Time zones for fugit and rufus-scheduler. Urbi et Orbi."
arch=('any')
url="https://github.com/floraison/et-orbi"
license=('MIT')
depends=('ruby' 'ruby-tzinfo')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha256sums=('d26e868cc21db88280a9ec1a50aa3da5d267eb9b2037ba7b831d6c2731f5df64')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${gemname}-${pkgver}.gem"
  rm "$pkgdir/$_gemdir/cache/${gemname}-${pkgver}.gem"
}

