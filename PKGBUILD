# Mainteiner: farawayer <farwayer@gmail.com>

pkgname=ruby-public_suffix-2
pkgver=2.0.5
pkgrel=3
pkgdesc='Domain name parser based on the Public Suffix List'
arch=('any')
url='https://simonecarletti.com/code/publicsuffix-ruby'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/public_suffix-$pkgver.gem")
noextract=("public_suffix-$pkgver.gem")
sha512sums=('d261dec44c11803631e267f36d82a59278d90dceb2811233ca511e895c5f1a58005b6afea980bd1bbd78bbfc7a3a4e02f9f1fbe351fded38be340ecc235da383')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" public_suffix-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/public_suffix-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/public_suffix-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
