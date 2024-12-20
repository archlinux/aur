# Maintainer: Václav Kubernát <sir.venceslas@gmail.com

pkgname=wireshark-chainpack-rpc-block-dissector-git
_gitname=chainpack-rpc-block-dissector
pkgdesc='A Wireshark dissector for chainpack-rpc-stream'
url='https://github.com/silicon-heaven/chainpack-rpc-block-dissector'
arch=('any')
pkgver=r21.9761cf5
pkgrel=1
license=('MIT')
depends=('cp2cp' 'wireshark-cli')
makedepends=('git')
source=('git+https://github.com/silicon-heaven/chainpack-rpc-block-dissector.git')
b2sums=('SKIP')

pkgver() {
	cd $srcdir/$_gitname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	dir=$pkgdir/usr/lib/wireshark/plugins
	mkdir -p $dir
	cp $srcdir/$_gitname/chainpack-rpc-block-dissector.lua $dir/
	install -Dm644 "$srcdir/$_gitname/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
