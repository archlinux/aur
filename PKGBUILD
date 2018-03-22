# Maintainer: Stelios Tsampas <loathingkernel @at gmail .dot com>

pkgname=ruby-connection_pool
pkgver=2.2.1
pkgrel=1
pkgdesc='Generic connection pool for Ruby'
arch=('any')
url='https://github.com/mperham/connection_pool'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/connection_pool-$pkgver.gem")
noextract=("connection_pool-$pkgver.gem")
sha512sums=('74167b200fcc02d3a60fdc0e71b44c80f1c72db75b5f604a442bd5fb55138fe1750a2db095e0283104fda35fd9024cb71c7ddb614c3d472f814d686b686b6ef0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir"/usr/bin connection_pool-$pkgver.gem
  rm "$pkgdir/$_gemdir"/cache/connection_pool-$pkgver.gem
  install -D -m644 "$pkgdir/$_gemdir"/gems/connection_pool-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
