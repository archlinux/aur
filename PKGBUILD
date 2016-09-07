# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=gettext-setup
pkgname=ruby-$_gemname
pkgver=0.6
pkgrel=1
pkgdesc='A gem that configures gettext for internationalization.'
arch=(any)
url='https://github.com/grosser/fast_gettex://github.com/puppetlabs/gettext-setup-gem'
license=('Apache-2.0')
depends=(ruby ruby-gettext ruby-fast_gettext)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('22bca3546d1adab89f1e49c22416398fa5f31e3148c010bb38b60bde831affa6')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
