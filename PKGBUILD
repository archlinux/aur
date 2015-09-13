# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname=ruby-multi_xml
pkgver=0.5.5
pkgrel=1
pkgdesc="Provides swappable XML backends utilizing LibXML, Nokogiri, Ox, or REXML."
arch=('any')
url="https://rubygems.org/gems/multi_xml"
license=('MIT')
depends=('ruby' 'ruby-bundler')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('08936dc294586ee1d178217cce577febe26315d7880e01e4f8e97cf2753b1945')
noextract=("${pkgname#*-}-${pkgver}.gem")

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

