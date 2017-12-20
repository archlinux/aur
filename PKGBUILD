# Maintainer: sulaweyo <sledge DOT sulaweyo AT gmail DOT com>
# Contributor: Paul Dunn <pwjdunn AT gmail DOT com>
# Contributor: sjuxax <sjuxax AT gmail DOT com>

pkgname=numad-git
pkgver=0.5
pkgrel=3
pkgdesc="numad is a deamon that monitors NUMA topology and usage and distributes loads for good locality for the purpose of providing the best performance, by avoiding unnecessary latency."
arch=('x86_64' 'i686')
license=('LGPL')
url="https://pagure.io/numad.git"
options=()
makedepends=('cmake' 'libsystemd' 'git')
source=("git+https://pagure.io/numad.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/numad"
	make
}

package() {
	install -Dm755 $srcdir/numad/numad "$pkgdir/usr/bin/numad"
	install -Dm644 $srcdir/numad/numad.8 $pkgdir/usr/share/man/man8
	install -Dm644 $srcdir/numad/numad.service $pkgdir/usr/lib/systemd/system/numad.service
}
