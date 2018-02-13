# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname=ruby-multi_xml
pkgver=0.6.0
pkgrel=2
pkgdesc="Provides swappable XML backends utilizing LibXML, Nokogiri, Ox, or REXML."
arch=('any')
url="https://rubygems.org/gems/multi_xml"
license=('MIT')
depends=('ruby' 'ruby-bundler')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('d24393cf958adb226db884b976b007914a89c53ad88718e25679d7008823ad52')
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
