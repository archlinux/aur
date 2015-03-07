# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
# Contributor: Martin Minka <martin.minka+arch@gmail.com>
pkgname=ruby-net-ssh-gateway
pkgver=1.2.0
pkgrel=4
pkgdesc="A gateway class for tunneling connections via SSH over a forwarded port"
arch=('any')
url="https://rubygems.org/gems/net-ssh-gateway"
license=('MIT')
depends=('ruby' 'ruby-net-ssh>=2.6.5')
source=(http://gems.rubyforge.org/gems/net-ssh-gateway-$pkgver.gem)
noextract=(net-ssh-gateway-$pkgver.gem)
md5sums=('7398dc8b2480c870eea3ccf1969f4913')

package() {
	cd "${srcdir}"
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" net-ssh-gateway-$pkgver.gem
}
