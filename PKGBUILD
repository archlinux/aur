# Maintainer: Kevin Velickovic <kevin dot velickovic at gmail dot com>
# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=fusuma
pkgname=ruby-$_gemname
pkgver=2.0.2
pkgrel=1
pkgdesc="Fusuma is multitouch gesture recognizer."
arch=(any)
url="https://github.com/iberianpig/fusuma"
license=(MIT)
depends=(ruby)
optdepends=('xdotool: Used to send shortcuts on Xorg'
            'ruby-fusuma-plugin-sendkey: Fusuma plugin that sending virtual keyboard events'
            'ruby-fusuma-plugin-keypress: Keypress combination plugin for Fusuma'
            'ruby-fusuma-plugin-tap: Window Manager plugin for Fusuma'
            'ruby-fusuma-plugin-wmctrl: Tap and Hold gestures plugin for Fusuma')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('3f8cbd380fe9c5bf315697fc5a61155240f92637')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
