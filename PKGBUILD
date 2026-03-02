# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: Lukas Deutz <lukas.deutz@mailfence.com>

_gemname=mdless
pkgname=ruby-$_gemname
pkgver=2.1.62
pkgrel=1
pkgdesc='A pager like less, but for Markdown files'
arch=(any)
url='http://brettterpstra.com/project/mdless/'
license=(MIT)
depends=(ruby ruby-redcarpet ruby-rouge ruby-tty-screen ruby-tty-spinner ruby-tty-which)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('61b5bef09d27a0f7e5a318b12c1293ce3d829eb5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

