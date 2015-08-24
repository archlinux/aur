# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Sid Karunaratne <sid@karunaratne.net>
# Contributor:  Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

pkgname=ruby-listen
pkgver=2.8.3
_realname="listen"
pkgrel=1
pkgdesc="The Listen gem listens to file modifications and notifies you about the changes. Works everywhere!"
arch=('any')
url="https://rubygems.org/gems/listen"
license=("MIT")
depends=('ruby' 'ruby-rb-inotify>=0.9' 'ruby-rb-fsevent>=0.9.3'
         'ruby-celluloid-0.16')
source=(http://gems.rubyforge.org/gems/$_realname-$pkgver.gem)
sha256sums=('fcad2e4342713fd12eadff0650a0d7d9a8aa88e88c5331d430ffe0692eca76b3')
noextract=($real_name-$pkgver.gem)

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}

