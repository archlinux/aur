# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Guilherme "nirev" Nogueira <guilherme@nirev.org>

pkgname=rhc
pkgver=1.38.7
pkgrel=1
pkgdesc="The client tools for the OpenShift platform that allow for application management."
arch=('any')
url="https://github.com/openshift/rhc"
license=('Apache')
depends=('ruby' 'ruby-archive-tar-minitar' 'ruby-commander-4.2.1' 'ruby-highline-1.6' 'ruby-httpclient-2.7'
         'ruby-net-scp' 'ruby-net-ssh' 'ruby-net-ssh-multi' 'ruby-open4')
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha1sums=('345f9d7e0a3ea8298cb908a449a35ae3b0ea6d58')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
