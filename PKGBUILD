# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Julius <com dot gmail at julius dot dehner>
# Contributor: vixfwis <com dot gmail at vixfwis>

_pkgname=youtube-dlp
pkgname=${_pkgname}-bin
_gitname=yt-dlp
pkgver=2021.04.22
_gitpkgver=$pkgver
pkgrel=1
pkgdesc="Fork of youtube-dlc - download videos from youtube.com or other video platforms"
arch=('any')
url="https://github.com/yt-dlp/${_gitname}"
license=('Unlicense')
depends=('python')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'aria2: for using aria2 as external downloader'
            'python-pycryptodome: for hlsnative downloader')
source=("yt-dlp-${_gitpkgver}::${url}/releases/download/${_gitpkgver}/yt-dlp")
provides=('yt-dlp')
sha256sums=('e00f7acdbb94b82e2c2cc78dfa7dfff7c783c23693d304a68db79672b0b8ea0e')

package() {
  install -Dm755 "yt-dlp-${_gitpkgver}" "${pkgdir}/usr/bin/yt-dlp"
}
