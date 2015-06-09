# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-vimdeck
pkgver=0.2.9
pkgrel=1
pkgdesc="VIM as a presentation tool"
arch=('any')
url="https://github.com/tybenz/vimdeck"
license=('MIT')
depends=('ruby' 'ruby-artii' 'ruby-asciiart' 'ruby-redcarpet')
optdepends=('vim-syntaxrange-git: SyntaxRange plugin must be installed')
source=("https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
sha256sums=('85767bbc67720ceb3d3e4b674795503433cde4e10f726fae00db7e4dc8a10ff5')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('ruby-vimdeck' 'vimdeck')
conflicts=('vimdeck')

package() {
  cd "$srcdir"

  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}
