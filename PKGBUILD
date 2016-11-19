# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-artii
pkgver=2.1.2
pkgrel=1
pkgdesc="A Figlet-based ASCII art generator, useful for comand-line based ASCII Art Generation"
arch=('any')
url="https://github.com/miketierney/artii"
license=('MIT')
depends=('ruby')
provides=('artii' 'ruby-artii')
conflicts=('artii')
source=("https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem"
        "LICENSE")
noextract=("${pkgname#*-}-${pkgver}.gem")
sha256sums=('15410369690634fccf801fd95ae9762c3b2b7254e17a07e77a069e5cd292bc49'
            '8b943160ff00be00386b1049f928fe846af996f5cc09950ffbfb5888a95a4320')

package() {
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
