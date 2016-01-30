# Maintainer: Jonathan Ryan <jryan@curious-computing.com>
pkgname=vncshare-git
pkgver=0.1
pkgrel=1
pkgdesc="Easily share your screen over HTTP using VNC."
arch=(any)
url="https://github.com/jryan0/vncshare"
license=('MIT')
groups=()
depends=(net-tools novnc openssl)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/jryan0/vncshare.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
  mkdir -p "$pkgdir/usr/bin"
  install vncshare "$pkgdir/usr/bin"
}
