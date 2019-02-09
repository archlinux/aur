pkgname=tremc-git
_gitname=${pkgname%-git}
pkgver=r692.4d50dab
pkgrel=1
pkgdesc="Curses interface for transmission - python3 fork of transmission-remote-cli"
arch=('any')
url="https://github.com/tremc/tremc"
license=('GPL3')
depends=('python')
makedepends=('git')
optdepends=('python-geoip: Guess which country peers come from'
            'python-xerox: Copy magnet links to the system clipboard') 
source=("git+https://github.com/louipc/tremc.git")
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_gitname"

    make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ts=4 sts=4 sw=4 et
