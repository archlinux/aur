# Maintainer: AbrarSyed <aur@abrarsyed.com>
pkgname=cloudfoundry-cli
pkgver=6.42.0
pkgrel=1
pkgdesc="The official command line client for Cloud Foundry"
arch=('x86_64')
url="https://github.com/cloudfoundry/cli"
license=('Apache')
provides=()
options=('!emptydirs' '!strip')

source=("cf-cli-${pkgver}-amd64.tar.gz::https://cli.run.pivotal.io/stable?release=linux64-binary&version=${pkgver}&source=github-rel")

md5sums=('a58bc5461bc844f318adb53a05f805d0')
sha256sums=('39940520903076fb5163a245bf64e24cb52624e3a5f8625eac16aebded6c0041')
sha512sums=('d440b36bd54893ec3478c59520cf6b369308637e72f65bd0b4a13fef066fd31198ec83240d3272f374b39d805fa2e8b62c93ae6844757e13655023eb4af31ae5')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license & notice
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install $srcdir/LICENSE "$pkgdir/usr/share/doc/cf-cli/LICENSE"
	install $srcdir/NOTICE "$pkgdir/usr/share/doc/cf-cli/NOTICE"
}

