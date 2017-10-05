# Maintainer: AbrarSyed <aur@abrarsyed.com>
pkgname=cloudfoundry-cli
pkgver=6.32.0
pkgrel=1
pkgdesc="The official command line client for Cloud Foundry"
arch=('i686' 'x86_64')
url="https://github.com/cloudfoundry/cli"
license=('Apache')
provides=()
options=('!emptydirs' '!strip')

source=("license.txt::https://raw.githubusercontent.com/cloudfoundry/cli/v${pkgver}/LICENSE")
source_i686=("cf-cli-${pkgver}-i686.tar.gz::https://cli.run.pivotal.io/stable?release=linux32-binary&version=${pkgver}&source=github-rel")
source_x86_64=("cf-cli-${pkgver}-amd64.tar.gz::https://cli.run.pivotal.io/stable?release=linux64-binary&version=${pkgver}&source=github-rel")

md5sums=('3b83ef96387f14655fc854ddc3c6bd57')
md5sums_i686=('9eb245189ebd1ca7a37783d9dca6fdc0')
md5sums_x86_64=('a2f97bfa7a03794b69d48accce611db6')
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_i686=('e43824ffff9fa753f226bd4326d30119b6d0d6ac3998cadf0cd14ca13b898e1c')
sha256sums_x86_64=('0a05521b7198dc8b92efbfb02a8fb04c84eeffeded3387aa3c9eb92ce4abef69')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install license.txt "$pkgdir/usr/share/doc/cf-cli/copyright"
}
