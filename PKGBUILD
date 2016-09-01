# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=capistrano
pkgver=3.6.1
pkgrel=1
pkgdesc='A remote server automation and deployment tool written in Ruby.'
arch=(any)
url='http://capistranorb.com'
license=('MIT')
depends=(ruby ruby-capistrano-harrow ruby-sshkit ruby-i18n ruby-airbrussh)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('b052341ed44a06d03c9043aa2b79d390b691bc4473c8e933c07544f592698e6c')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
}
