# Maintainer: AbrarSyed <aur@abrarsyed.com>
pkgname=cloudfoundry-cli
pkgver=7.0.1
pkgrel=1
pkgdesc="The official command line client for Cloud Foundry"
arch=('x86_64')
url="https://github.com/cloudfoundry/cli"
license=('Apache')
provides=()
options=('!emptydirs' '!strip')

source=("cf-cli-${pkgver}-amd64.tar.gz::https://cli.run.pivotal.io/stable?release=linux64-binary&version=${pkgver}&source=github-rel")

md5sums=('732d2dbd97a43095eab21eea8257925a')
sha256sums=('7f23be34b55c8b6c47ea18b41dd1fbf8b5d23ba3ac219bbc08bd80d782a8d497')
sha512sums=('bde3a06f421161e655bec6025c1ef8ed406eccd76702fa5f5ebb27e30368b44e7730357ee2b155252f6f252a260253e280188dd7ea682df7ab9ea2df9f92b3cf')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license & notice
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install $srcdir/LICENSE "$pkgdir/usr/share/doc/cf-cli/LICENSE"
	install $srcdir/NOTICE "$pkgdir/usr/share/doc/cf-cli/NOTICE"
}

