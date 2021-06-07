# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=whatmp3-git
_gitname=whatmp3
pkgver=128.6b0fe1e
pkgrel=1
pkgdesc="A small Python script that accepts a list of directories containing FLAC files as arguments and converts them to MP3 with the specified options. It can optionally create a torrent file."
url="https://github.com/RecursiveForest/whatmp3"
arch=('any')
license=('MIT')
provides=('whatmp3=3.6')
conflicts=('whatmp3')
depends=('python' 'mktorrent' 'flac')
makedepends=('git')
optdepends=('vorbis-tools: OGG Vorbis support'
            'lame: MP3 support'
            'neroaacenc: AAC support'
            'neroaactag: AAC support'
            'mp3gain: ReplayGain support'
            'vorbisgain: ReplayGain support'
            'aacgain: ReplayGain support'
            'sox: dither support')
source=('git+https://github.com/RecursiveForest/whatmp3.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
