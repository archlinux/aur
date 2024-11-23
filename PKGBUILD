# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=fastanime
pkgver=2.8.3
pkgrel=2
pkgdesc="FastAnime, anime site experience from the terminal."
arch=('x86_64')
url="https://github.com/Benex254/FastAnime"
license=('Unlicense')
makedepends=('python>=3.10' 'python-installer')
depends=('python'
         'python-click'
         'python-fastapi'
         'python-inquirerpy'
         'libtorrent'
         'python-plyer'
         'python-pytest'
         'python-requests'
         'python-rich'
         'python-thefuzz'
         'yt-dlp'
         'python-dbus')
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
provides=('fastanime')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "${srcdir}" || exit
    cd "FastAnime-${pkgver}" || exit
    python -m build --wheel
}

package() {
    cd "${srcdir}" || exit
    cd "FastAnime-${pkgver}" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('SKIP')
