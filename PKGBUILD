# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=spectro
pkgname=spectro-git
pkgver=r48.1714c5a
pkgrel=2
pkgdesc="Provides BBCode formatted text with the spectrograms of audio files."

arch=('any')
url="https://github.com/welpo/spectro"
license=('GPL3')

makedepends=('git')
depends=('sox' 'curl')
optdepends=('ffmpeg: to process ape, WMA, MP4 and AAC files'
            'imagemagick: to use the --compare feature'
            'optipng: to optimise the spectrograms'
            'perl: to include the file SHA on the output (shasum)')

source=("git+https://github.com/welpo/spectro.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
}

package() {
  cd "$_pkgname"
  install -Dm755 "spectro" "$pkgdir/usr/bin/spectro"
}
