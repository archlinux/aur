# Maintainer: Shane Chen <ss1ha3tw@gmail.com>
pkgname=pulxc-git
pkgver=r17.8c75a9f
pkgrel=1
pkgdesc="A per user LXC for workstation environment"
arch=('x86_64')
url="https://github.com/ss1h2a3tw/pulxc"
license=('GPL3')
groups=()
depends=('lxc')
optdepends=('arch-install-scripts: For creating archlinux LXC')
makedepends=('git')
provides=("pulxc")
conflicts=("pulxc")
replaces=()
backup=('etc/pulxc/pulxc.conf' 'etc/pulxc/pulxc-lxc.conf' 'var/lib/pulxc/nextip')
options=()
install=pulxc.install
source=('git+https://github.com/ss1h2a3tw/pulxc')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/pulxc"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/pulxc"
	make
}

package() {
	cd "$srcdir/pulxc"
    echo $pkgdir
	make DESTDIR="$pkgdir" install
}
