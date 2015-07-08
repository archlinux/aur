# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Guilherme "nirev" Nogueira <guilherme@nirev.org>

pkgname=rhc
pkgver=1.36.4
pkgrel=2
pkgdesc="The client tools for the OpenShift platform that allow for application management."
arch=('any')
url="https://github.com/openshift/rhc"
license=('Apache')
depends=('ruby' 'ruby-archive-tar-minitar' 'ruby-commander<4.3.0' 'ruby-highline<1.7.0' 'ruby-httpclient'
         'ruby-net-scp' 'ruby-net-ssh<2.9.3' 'ruby-net-ssh-multi' 'ruby-open4')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha1sums=('58370edec2c53180fd07ce61fcab56df6b8168bc')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
