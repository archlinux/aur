# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=librarianp
pkgname=ruby-$_gemname
pkgver=0.6.3
pkgrel=1
pkgdesc='A Framework for Bundlers, used by librarian-puppet.'
arch=(any)
url='https://github.com/voxpupuli/librarian'
license=('MIT')
depends=(ruby ruby-thor)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('84e9c1be3ca0aca4bd4e6cbfa465fd0e5bb5c71bb442c08422ed8b403a0f93a7')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
