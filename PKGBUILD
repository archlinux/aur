_gemname=rvpacker
pkgname=ruby-$_gemname
pkgver=1.2.0
pkgrel=1
pkgdesc="Pack and unpack RPG Maker data files"
arch=(any)
url="https://github.com/akesterson/rvpacker"
license=("MIT")
depends=(ruby-psych ruby-trollop ruby-formatador)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
md5sums=('cb721d32cd56862cab89499b392a5a5f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
