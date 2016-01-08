# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=domain_name
pkgname=ruby-$_gemname
pkgver=0.5.25
pkgrel=1
pkgdesc='This is a Domain Name manipulation library for Ruby. It can also be used for cookie domain validation based on the Public Suffix List.'
arch=('any')
url='https://github.com/knu/ruby-domain_name'
license=('BSD-2-Clause' 'BSD-3-Clause' 'MPL-1.1' 'GPL-2.0' 'LGPL-2.1')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby' 'ruby-unf')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('5b492888a095f2f00027a268932c93d0432bf8ada568a5c601ff53ce6a761b9b')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
