# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
_gemname=git-version-bump
pkgname=ruby-$_gemname
pkgver=0.15.1
pkgrel=1
pkgdesc='Manage your app version entirely via git tags'
arch=("any")
url='http://theshed.hezmatt.org/git-version-bump'
license=("GPL3")
depends=("ruby")
options=("!emptydirs")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha1sums=('c17f120ed823f4e9eda1832dec10db1f5685ffc6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
