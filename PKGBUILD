# Maintainer: Gabriel Matthews <matthewriel63@gmail.com> 

pkgname='yt-watch-git'
_pkgname='yt-watch'
pkgver=r5.39af252
pkgrel=1
pkgdesc="Search/Watch/Download/Convert YouTube Videos on mpv using yt-dlp/YouTube API."
arch=('any')
url="https://github.com/Kungger-git/yt-watch"
license=('GPL3')
depends=('jq' 'mpv' 'curl' 'xclip' 'yt-dlp')
makedepends=('git')
source=("yt-watch::git+$url.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/${_pkgname%-VCS}"
        install -Dm755 ./yt-watch "$pkgdir/usr/bin/yt-watch"
}
