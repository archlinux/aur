# Maintainer: Edoardo Brogiolo <edoardo at brogiolo dot eu>
# Contributor Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Julius <com dot gmail at julius dot dehner>
# Contributor: vixfwis <com dot gmail at vixfwis>

_pkgname=youtube-dlp
pkgname=${_pkgname}-bin
_gitname=yt-dlp
pkgver=2021.08.10
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
conflicts=("${_pkgname}")
provides=('yt-dlp' "${_pkgname}")
sha256sums=('41bb52a3b024961237339368b62ed89920305361f8c931205916ff5da93e64bc')

package() {
  install -Dm755 "yt-dlp-${_gitpkgver}" "${pkgdir}/usr/bin/yt-dlp"
}
