# Maintainer: PAPPY <pappy _AT_ a s c e l i o n _DOT_ com>

pkgname=cloudfoundry6-cli
pkgver=6.52.0
pkgrel=1
pkgdesc="The official command line client for Cloud Foundry (stuck to version 6)"
arch=(x86_64)
url="https://github.com/cloudfoundry/cli"
license=('Apache')
provides=(cf)
conflicts=(cloudfoundry-cli)
options=('!emptydirs' '!strip')

source=(
	"cf-cli-$pkgver-amd64.tar.gz::https://packages.cloudfoundry.org/stable?release=linux64-binary&version=$pkgver&source=github-rel"
	"cf-cli-completion::https://raw.githubusercontent.com/cloudfoundry/cli-ci/master/ci/installers/completion/cf"
)

sha256sums=('8438c082bee652aa5e21cdc3e92348aac4751af2ea8afff37f402f2780efef60'
            'f3f05a2414075c00b101b05f73cf260b9eec9966659adf2957c1b2937bd4c48e')

package() {
	cd $srcdir

	install -Dm755 cf $pkgdir/usr/bin/cf
	install -Dm644 cf-cli-completion $pkgdir/usr/share/bash-completion/completions/cf

	install -dm755 $pkgdir/usr/share/doc/cf-cli

	install LICENSE $pkgdir/usr/share/doc/cf-cli/LICENSE
	install NOTICE $pkgdir/usr/share/doc/cf-cli/NOTICE
}

