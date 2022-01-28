# Maintainer: Mark Kostovetskyy <mark at sgtxd dot de >
pkgname='ani-cli-git'
_pkgname='ani-cli'
pkgver=r404.85ab56b
pkgrel=1
pkgdesc="A cli to browse and watch anime. (development version)"
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'openssl' 'jq' 'mpv')
optdepends=('vlc: An alternative video player'
'aria2: For downloading episodes')
makedepends=('git')
source=('ani-cli::git+https://github.com/pystardust/ani-cli.git')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/${_pkgname%-VCS}"
        install -Dm755 ./ani-cli "$pkgdir/usr/bin/ani-cli"
}
