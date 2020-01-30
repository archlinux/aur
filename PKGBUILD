# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_gemname="rr"
pkgname="ruby-${_gemname}-bootstrap"
pkgver=1.2.1
pkgrel=1
pkgdesc="RR is a test double framework that features a rich selection of double techniques and a terse syntax (bootstrap version)"
arch=(any)
url="https://rr.github.io/rr"
license=("MIT")
depends=("ruby")
conflicts=("ruby-${_gemname}")
provides=("ruby-${_gemname}")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
md5sums=('4fa05d50fc8bee7538da49f17baedb2f')

package() {
  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bootstrap}/LICENSE"

  rm -rf "$pkgdir/$_gemdir/cache"
}
