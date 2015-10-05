# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Guilherme "nirev" Nogueira <guilherme@nirev.org>

pkgname=rhc
pkgver=1.37.1
pkgrel=1
pkgdesc="The client tools for the OpenShift platform that allow for application management."
arch=('any')
url="https://github.com/openshift/rhc"
license=('Apache')
depends=('ruby' 'ruby-archive-tar-minitar' 'ruby-commander<4.3.0' 'ruby-highline<1.7.0' 'ruby-httpclient'
         'ruby-net-scp' 'ruby-net-ssh<2.9.3' 'ruby-net-ssh-multi' 'ruby-open4')
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha1sums=('b92bb65f40f2f4df0199be2b22d179ddf7fc3518')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
