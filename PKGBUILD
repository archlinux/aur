# Maintainer: AbrarSyed <aur@abrarsyed.com>
pkgname=cloudfoundry-cli
pkgver=7.2.0
pkgrel=1
pkgdesc="The official command line client for Cloud Foundry"
arch=('x86_64')
url="https://github.com/cloudfoundry/cli"
license=('Apache')
provides=()
options=('!emptydirs' '!strip')

source=("cf-cli-${pkgver}-amd64.tar.gz::https://cli.run.pivotal.io/stable?release=linux64-binary&version=${pkgver}&source=github-rel")

md5sums=('820d5285c293b63b2a5e554c74de777c')
sha256sums=('e7e6284ebc3c9002681a924c199ea4a79ff22f8a5820afe24a1bae8142143332')
sha512sums=('8562032a4ee665b97211df7fa2277175b366c5e0736b1c4993cf4d702fb7318261253bf779fdae6e62d10b3850680181a631d90a43bdc9f9c465584d95f980f3')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license & notice
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install $srcdir/LICENSE "$pkgdir/usr/share/doc/cf-cli/LICENSE"
	install $srcdir/NOTICE "$pkgdir/usr/share/doc/cf-cli/NOTICE"
}

