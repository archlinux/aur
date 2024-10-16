# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname=ruby-multi_xml
pkgver=0.7.1
pkgrel=1
pkgdesc="Provides swappable XML backends utilizing LibXML, Nokogiri, Ox, or REXML."
arch=('any')
url="https://rubygems.org/gems/multi_xml"
license=('MIT')
depends=('ruby' 'ruby-bundler')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('4fce100c68af588ff91b8ba90a0bb3f0466f06c909f21a32f4962059140ba61b')
noextract=("${pkgname#*-}-${pkgver}.gem")

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}
