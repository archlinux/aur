pkgname=tremc-git
_gitname=${pkgname%-git}
pkgver=r671.5f2e6a3
pkgrel=1
pkgdesc="Curses interface for transmission - python3 fork of transmission-remote-cli"
arch=('any')
url="https://github.com/louipc/tremc"
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

    install -D -m755 "tremc" "${pkgdir}/usr/bin/tremc"
    install -D -m644 "tremc.1" "${pkgdir}/usr/share/man/man1/tremc.1"
    install -D -m755 "completion/bash/tremc.sh" "${pkgdir}/usr/share/bash-completion/completions/tremc"
    install -D -m755 "completion/zsh/_tremc" "${pkgdir}/usr/share/zsh/site-functions/_tremc"
}

# vim: ts=4 sts=4 sw=4 et
