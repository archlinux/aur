# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=vn-ki
pkgname=anime-downloader-git
_gitname=anime-downloader
pkgver=0.r290.264b912
pkgrel=1
pkgdesc='cli anime streamer and downloader'
url='https://github.com/vn-ki/anime-downloader.git'
arch=('any')
license=('unlicense')
depends=('aria2' 'python-beautifulsoup4' 'python-requests' 'python-click' 'python-fuzzywuzzy' 'python-coloredlogs' 'python-cfscrape' 'python-requests-cache' 'python-tabulate' 'python-pycryptodome' 'python')
makedepends=('git')
provides=('anime-downloader')

source=("git+https://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  python setup.py install --root=$pkgdir
}
