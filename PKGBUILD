# Maintainer: envolution
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=rmail
pkgname=ruby-rmail
pkgver=1.1.4
pkgrel=1
pkgdesc='A MIME mail parsing and generation library.'
arch=(any)
url='https://github.com/terceiro/rmail'
license=(BSD-3-Clause) #https://github.com/terceiro/rmail/blob/f17e67deb2ef75e06ad7308a1e87f8e856e8cb5b/LICENSE
depends=(ruby ruby-erb)
conflicts=(ruby-rmail-sup)
options=(!emptydirs)
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  'https://github.com/terceiro/rmail/blob/f17e67deb2ef75e06ad7308a1e87f8e856e8cb5b/LICENSE'
)
noextract=($_gemname-$pkgver.gem)
md5sums=('7b21d31a66ddbeef5e896475ba95a5c8'
         'de5232f53892626f4c068fd4f52ff7ed')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
