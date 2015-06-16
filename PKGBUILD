# Maintainer: Brandon Mulcahy <brandon@jangler.info>
_gemname=droxi
pkgname=$_gemname
pkgver=0.4.1
pkgrel=1
pkgdesc='An ftp-like command-line interface to Dropbox'
arch=(any)
url='http://jangler.info/code/droxi'
license=(MIT)
depends=(ruby-dropbox-sdk)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('16df8c5db927651106b4df202d37dcaa7a6d61a055067e174b2fa9c13e7937b8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
