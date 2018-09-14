# Maintainer: John Gerritse <tyrannis.hawk@gmail.com>

_gemname=video_transcoding
pkgname=ruby-$_gemname
pkgver=0.20.0
pkgrel=2
pkgdesc='Tools to transcode, inspect and convert videos.'
arch=(any)
url='https://github.com/donmelton/video_transcoding'
license=(Ruby)
makedepends=('ruby-rdoc')
depends=('ruby' 'handbrake-cli' 'mkvtoolnix-cli' 'libmp4v2' 'ffmpeg')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('9ac03472068ee38e5b051e54b3d49df8433826f8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
