# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-aliyun
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=1
pkgdesc='As a FOG provider, fog-aliyun support aliyun OSS/ECS. It will support more aliyun services later.'
arch=(any)
url='https://github.com/fog/fog-aliyun'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-ipaddress)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('d1d1de7c58a6f33b2db41658ba92a230fd94edc154631f6c5d6662bbc4ea29f4e28321b71228616888b0038af13ebf092d00d9f6305a3201b4b4b7d164d52a47')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
