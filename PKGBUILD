# Maintainer: Mark Kostovetskyy <mark at sgtxd dot de >
pkgname='ani-cli-git'
_pkgname='ani-cli'
pkgver=r251.75409cc
pkgrel=6
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'curl' 'sed' 'mpv' 'aria2')
optdepends=('vlc: alternative video player')
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
