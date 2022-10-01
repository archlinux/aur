# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fission
pkgname=ruby-$_gemname
pkgver=0.5.0
pkgrel=2
pkgdesc="A simple utility to manage VMware Fusion VMs from the command line."
arch=('any')
url="https://github.com/thbishop/fission/"
license=('MIT')
depends=('ruby' 'ruby-cfpropertylist')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
sha512sums=('7306bf076fcc5265b05b517e2eb8ca32e4038f99ee6c4d83b4ebf7374dd6ad5b07182f3fc690db964720df0041641e458c549ae30fc4f2ca17a4837629db3cbb')
