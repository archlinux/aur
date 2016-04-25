# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>

_gemname=pry
pkgname=ruby-$_gemname
pkgver=0.10.3
pkgrel=1
pkgdesc='An IRB alternative and runtime developer console.'
arch=(any)
url='http://pryrepl.org'
license=(MIT)
depends=(ruby ruby-coderay ruby-slop-3 ruby-method_source)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('ef6b1cfd58c317446e39d68587e036c3e27432440a8517f93c43f364eecee8f4')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
