_gemname=rvpacker
pkgname=ruby-$_gemname
pkgver=1.2.0
pkgrel=2
pkgdesc="Pack and unpack RPG Maker data files"
arch=(any)
url="https://github.com/akesterson/rvpacker"
license=("MIT")
depends=(ruby-trollop ruby-formatador)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
provides=("ruby-psych=2.0.0")
conflicts=("ruby-psych=2.0.0")
md5sums=('cb721d32cd56862cab89499b392a5a5f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/"*.gem
  rm -r "$pkgdir/$_gemdir/gems/"{formatador,trollop}-*
  rm "$pkgdir/$_gemdir/specifications/"{formatador,trollop}-*.gemspec
}
