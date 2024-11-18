# Maintainer: Aethar <elliott.ashby88@gmail.com>

_pkgname=fastanime
pkgname="${_pkgname}-git"
pkgver=2.7.7
pkgrel=1
pkgdesc="FastAnime, anime site experience from the terminal."
arch=('x86_64')
url="https://github.com/Benex254/FastAnime"
license=('Unlicense')
makedepends=('python>=3.10' 'git' 'uv' 'python-installer')
optdepends=('mpv: video player'
            'webtorrent-cli: nyaa torrents'
            'ffmpeg: download hls streams' 
            'rofi: alternative ui'
            'fzf: alternative ui'
            'chafa: terminal image viewer'
            'icat: kitty terminal image viewer'
            'bash: preview script language'
            'ani-skip-git: skip anime openings'
            'ffmpegthumbnailer: local previews'
            'syncplay: watch with friends'
            'feh: image viewer (for manga mode)')
source=("git+${url}.git")

build() {
    cd "${srcdir}" || exit
    cd FastAnime || exit
    uv build
}

package() {
    cd "${srcdir}" || exit
    cd FastAnime || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('SKIP')
