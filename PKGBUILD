# Maintainer: Mark <mark at sgtxd dot de >
pkgname='ani-cli-git'
_pkgname='ani-cli'
pkgver=r803.72d7f72
pkgrel=1
pkgdesc="A cli to browse and watch anime. (development version)"
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'mpv' 'aria2' 'ffmpeg' 'fzf' 'botan')
optdepends=('vlc: An alternative video player' 'ani-skip: For skipping anime intros')
makedepends=('git')
provides=('ani-cli')
conflicts=('ani-cli')
source=('ani-cli::git+https://github.com/pystardust/ani-cli.git')
md5sums=('SKIP')
install="$pkgname.install"

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/${_pkgname%-VCS}"
	install -Dm755 "./ani-cli" "$pkgdir/usr/bin/ani-cli"
	install -Dm644 "./ani-cli.1" "$pkgdir/usr/share/man/man1/ani-cli.1"
}
