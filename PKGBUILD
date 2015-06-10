# Maintainer: Luca Russo <vargolo@gmail.com>
# Contributor: Sigitas Mazaliauskas <sigisnn@gmail.com>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>

pkgname=ruby-libnotify
pkgver=0.5.1
pkgrel=2
pkgdesc="ruby bindings for libnotify, a library for desktop notifications"
arch=('i686' 'x86_64')
url="http://github.com/vargolo/ruby-libnotify"
license=('LGPL')
depends=('ruby' 'libnotify' 'ruby-gtk2')
makedepends=('ruby-pkgconfig')
source=(http://gems.rubyforge.org/gems/${pkgname}-${pkgver}.gem)
noextract=(${pkgname}-${pkgver}.gem)
md5sums=('174e7e63d5807aa2cae054d5d94ad666')

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" ${pkgname}-${pkgver}.gem
}
