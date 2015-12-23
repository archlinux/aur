# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-vimdeck
pkgver=0.3.1
pkgrel=1
pkgdesc="VIM as a presentation tool"
arch=('any')
url="https://github.com/tybenz/vimdeck"
license=('MIT')
depends=('ruby' 'ruby-artii' 'ruby-rasciiart' 'ruby-redcarpet')
optdepends=('vim-syntaxrange-git: SyntaxRange plugin must be installed')
source=("https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
sha256sums=('d01b0ee3664627742792fa7b427e96c43e4783c7c3e9451351628b9f7ccefc1a')
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
