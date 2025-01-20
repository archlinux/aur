pkgname=file-warden
pkgver=1.0.0
pkgrel=1
pkgdesc="Systemd-managed file monitoring"
arch=('x86_64')
url="https://github.com/AntoninoAdornetto/file-warden"
license=('GPL3')
depends=('libnotify>=0.8.0')
makedepends=('gcc' 'pkg-config' 'git')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --tags | sed 's/^v//'
}

build() {
    cd $pkgname
    make build
}

package() {
    cd $pkgname
    make DEST_DIR="$pkgdir" PREFIX="/usr" install
}
