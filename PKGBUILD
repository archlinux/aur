# Maintainer: gryffyn <aur at evan dot me>

_gemname=zsteg
pkgname=$_gemname
pkgver=0.2.2
pkgrel=1
pkgdesc="detect stegano-hidden data in PNG & BMP"
arch=(any)
url='https://github.com/zed-0xff/zsteg'
license=(MIT)
depends=('ruby' 'ruby-zpng' 'ruby-iostruct')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('f3f6bbaf46e5c9f0598aa8b8f457dad890873e4c4e382f6c22e408fd34958ad7')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  install -d -m 755 ${pkgdir}/usr/bin
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
