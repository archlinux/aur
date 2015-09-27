# Maintainer: 
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Sid Karunaratne <sid@karunaratne.net>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>

pkgname=ruby-listen
pkgver=3.0.3
pkgrel=1
pkgdesc="The Listen gem listens to file modifications and notifies you about the changes. Works everywhere!"
arch=('any')
url="https://rubygems.org/gems/listen"
license=("MIT")
depends=('ruby' 'ruby-rb-inotify>=0.9' 'ruby-rb-fsevent>=0.9.3')
source=("https://rubygems.org/downloads/listen-$pkgver.gem")
noextract=("listen-$pkgver.gem")
sha256sums=('4be05d749cc8642e11ba19f938c5e8a4f5a60ded40a6940e9f99763a25d49082')
options=('!emptydirs')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir"/usr/bin listen-$pkgver.gem

  rm "$pkgdir/$_gemdir"/cache/listen-$pkgver.gem
  install -Dm0644 "$pkgdir/$_gemdir"/gems/listen-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
