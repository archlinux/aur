# Maintainer: Jonathan Ryan <jryan@curious-computing.com>
pkgname=vncshare-git
pkgver=r28.791c5ca
pkgrel=2
pkgdesc="Easily share your screen over HTTP using VNC."
arch=(any)
url="https://github.com/jryan128/vncshare"
license=('MIT')
groups=()
depends=(net-tools novnc openssl bash)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/jryan128/vncshare.git')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p "$pkgdir/usr/bin"
  install vncshare "$pkgdir/usr/bin"
}
