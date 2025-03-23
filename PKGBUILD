# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
# Contributor: gryffyn <aur at evan dot me>

_gemname=iostruct
pkgname="ruby-${_gemname}"
pkgver=0.5.0
pkgrel=1
pkgdesc="A Struct that can read/write itself from/to IO-like objects"
arch=(any)
url='https://rubygems.org/gems/iostruct'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('7761b5b6e16d1ff3a709be4c4a5ab66811b15f06da7c7dab5f20b5f425f45c5f')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
