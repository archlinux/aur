# Maintainer: AbrarSyed <aur@abrarsyed.com>
pkgname=cloudfoundry-cli
pkgver=6.34.1
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
md5sums_i686=('a13b9a85be0b2c27dddfe1de1902376f')
md5sums_x86_64=('da6132afcfdb184234f14aa5a2a72604')
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_i686=('346ca9e1259a7ac2595b6982048cdf7a2f9302145c23d5a6f2f6d06ce5f305dc')
sha256sums_x86_64=('95f25b19ad7645124752072b595ae9e7df66fc7fb48f633b63e7d9d7a9e0b1bc')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install license.txt "$pkgdir/usr/share/doc/cf-cli/copyright"
}
