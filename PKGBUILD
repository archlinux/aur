# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=unisec
_gemname=$pkgname
pkgver=0.0.5
pkgrel=1
pkgdesc='Unicode Security Toolkit.'
arch=('any')
url='https://acceis.github.io/unisec'
#url='https://github.com/Acceis/unisec'
license=('MIT')
depends=('ruby' 'ctf-party' 'ruby-dry-cli' 'ruby-paint' 'ruby-twitter_cldr'
         'ruby-unicode-confusable')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('5e323a59654ee9edcbd92aa31692ec0465f4c9548cf86e4eca9b9f160ba7bfade13545141fa6ceedaf7a9945c3fef89dab462cc24dda1ff2f3473d82ee0fadd5')

package() {
  _gemhome="$(gem env home)"

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemhome" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"

  rm "$pkgdir/$_gemhome/cache/$_gemname-$pkgver.gem"

  install -Dm 644 "$pkgdir/$_gemhome/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

