pkgname=wireshark-zmtp-dissector-git
pkgdesc='A Wireshark dissector for the ZeroMQ transfer protocol'
url='https://github.com/whitequark/zmtp-wireshark'
arch=('any')
pkgver=0
pkgrel=1
license=('MIT')
depends=('wireshark-cli=2.0.1')
makedepends=('git')
source=('zmtp-wireshark::git+https://github.com/whitequark/zmtp-wireshark.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd $srcdir/zmtp-wireshark
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	dir=$pkgdir/usr/lib/wireshark/plugins/2.0.1
	mkdir -p $dir
	cp $srcdir/zmtp-wireshark/zmtp-dissector.lua $dir/
}
