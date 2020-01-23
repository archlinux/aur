# Maintainer: AbrarSyed <aur@abrarsyed.com>
pkgname=cloudfoundry-cli
pkgver=6.49.0
pkgrel=1
pkgdesc="The official command line client for Cloud Foundry"
arch=('x86_64')
url="https://github.com/cloudfoundry/cli"
license=('Apache')
provides=()
options=('!emptydirs' '!strip')

source=("cf-cli-${pkgver}-amd64.tar.gz::https://cli.run.pivotal.io/stable?release=linux64-binary&version=${pkgver}&source=github-rel")

md5sums=('dbd9d6f47190d7e7e358bfc2a5b2d13a')
sha256sums=('fafcd4a701897c5eb44168ca7bd0c4502e442ea65324ffaca71b0a4b344c9a99')
sha512sums=('f30d3076d5d376551126b45d5f28b2fbc63b2a0767aeee5fdec8861c3cadf5c1301964124ae8d0845a3a443d0ac72b73c5bda0a2731bca18a98489735daf21fd')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license & notice
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install $srcdir/LICENSE "$pkgdir/usr/share/doc/cf-cli/LICENSE"
	install $srcdir/NOTICE "$pkgdir/usr/share/doc/cf-cli/NOTICE"
}

