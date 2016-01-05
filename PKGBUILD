# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=teamocil
pkgver=1.4
pkgrel=1
pkgdesc="Teamocil helps you set up window and splits layouts for tmux using YAML configuration files."
arch=(any)
url=http://remiprev.github.com/teamocil
license=(MIT)
depends=(ruby tmux)
makedepends=(rubygems)
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
md5sums=('56e89d660768cedcfc45ecadbe6b7089')

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies --verbose -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin $pkgname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
