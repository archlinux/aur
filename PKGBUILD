# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
# Contributor: Martin Minka <martin.minka+arch@gmail.com>
pkgname=ruby-net-ssh-gateway
pkgver=2.0.0
pkgrel=1
pkgdesc="A gateway class for tunneling connections via SSH over a forwarded port"
arch=('any')
url="https://rubygems.org/gems/net-ssh-gateway"
license=('MIT')
depends=('ruby' 'ruby-net-ssh>=4.0.0')
source=(http://gems.rubyforge.org/gems/net-ssh-gateway-$pkgver.gem)
noextract=(net-ssh-gateway-$pkgver.gem)
sha256sums=('99caed1ae3fd0ab191657b61adb3f2df83d139eac0586aa74ca177834b7521fd')

package() {
	cd "${srcdir}"
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" net-ssh-gateway-$pkgver.gem
}
