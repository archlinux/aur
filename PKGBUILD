# Maintainer: AbrarSyed <aur@abrarsyed.com>
pkgname=cloudfoundry-cli
pkgver=6.44.1
pkgrel=1
pkgdesc="The official command line client for Cloud Foundry"
arch=('x86_64')
url="https://github.com/cloudfoundry/cli"
license=('Apache')
provides=()
options=('!emptydirs' '!strip')

source=("cf-cli-${pkgver}-amd64.tar.gz::https://cli.run.pivotal.io/stable?release=linux64-binary&version=${pkgver}&source=github-rel")

md5sums=('ef6a39522bade131210b695ad49206d0')
sha256sums=('b986a55fef4bd6f580d7a070f4592362309fe009ffdd9489b9d3b871aed07aa3')
sha512sums=('0504e335f4b71a397d57a2d2c2dee759104cfffc73c03e2664aea76661b5de2128793c372cadfd43b7d8940333bfd2617133b7310c76d0ff4d16d60d9ee66b39')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license & notice
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install $srcdir/LICENSE "$pkgdir/usr/share/doc/cf-cli/LICENSE"
	install $srcdir/NOTICE "$pkgdir/usr/share/doc/cf-cli/NOTICE"
}

