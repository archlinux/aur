# Maintainer: 2GMon <2gmon.t@gmail.com>

_gemname=pluggaloid
pkgname=ruby-$_gemname
pkgver=1.0.2
pkgrel=1
pkgdesc='Extensible plugin system'
arch=(any)
url=''
license=(MIT)
depends=(ruby ruby-delayer ruby-instance_storage)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('dd024ff41cbcadeb16f1a5e0bcca142adda2511a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
