# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >

_gemname=aes_key_wrap
pkgname=ruby-$_gemname
pkgver=1.1.0
pkgrel=1
pkgdesc='AES Key Wrap, a.k.a RFC 3394, a.k.a NIST Key Wrap'
arch=('any')
url="https://rubygems.org/gems/$_gemname"
license=('MIT')
depends=(
  'ruby'
)
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('b935f4756b37375895db45669e79dfcdc0f7901e12d4e08974d5540c8e0776a5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
