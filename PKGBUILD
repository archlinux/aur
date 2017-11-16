# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=gettext-setup
pkgname=ruby-$_gemname
pkgver=0.28
pkgrel=1
pkgdesc='A gem that configures gettext for internationalization.'
arch=(any)
url='https://github.com/puppetlabs/gettext-setup-gem'
license=('Apache-2.0')
depends=(ruby ruby-gettext ruby-fast_gettext)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('4c6febf6eb86f52663e64ff666cd8a7a3c8b4aa124969dff90fabc697e5dbc0a')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
