# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=em-winrm
pkgname=ruby-$_gemname
pkgver=0.7.0
pkgrel=1
pkgdesc='EventMachine based, asynchronous parallel WinRM client'
arch=(any)
url='http://github.com/schisamo/em-winrm'
license=(MIT)
depends=('ruby' 'ruby-eventmachine>1.0.0' 'ruby-mixlib-log>=1.3.0' 'ruby-uuidtools>2.1.1' 'ruby-winrm>1.3.0')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('7f931faf270f6a01956f711e85a673d70c373660d5636e19c4083ccbc129aae596e98d1b1e21465178feb8c69f6b12edc79cdb82682a8533b8a142d8cd57500a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
