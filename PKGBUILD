# Maintainer: Braulio Oliveira <braulibo@gmail.com>

gemname=raabro
pkgname=ruby-raabro
pkgver=1.4.0
pkgrel=1
pkgdesc="A very dumb PEG parser library, with a horrible interface"
arch=('any')
url="https://github.com/jmettraux/raabro"
license=('MIT')
depends=('ruby')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha256sums=('d4fa9ff5172391edb92b242eed8be802d1934b1464061ae5e70d80962c5da882')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${gemname}-${pkgver}.gem"
  rm "$pkgdir/$_gemdir/cache/${gemname}-${pkgver}.gem"
}

