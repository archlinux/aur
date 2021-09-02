# Maintainer: Edoardo Brogiolo <edoardo at brogiolo dot eu>
# Contributor Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Julius <com dot gmail at julius dot dehner>
# Contributor: vixfwis <com dot gmail at vixfwis>

_pkgname=youtube-dlp
pkgname=${_pkgname}-bin
_gitname=yt-dlp
pkgver=2021.09.02
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
sha256sums=('5109928ae16dcaaae8360e59a2683bc858c3b302b111648efc787c8152aca1f9')

package() {
  install -Dm755 "yt-dlp-${_gitpkgver}" "${pkgdir}/usr/bin/yt-dlp"
}
