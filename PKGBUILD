# Maintainer: AbrarSyed <sacabrarsyed g-mail>
pkgname=cloudfoundry-cli
pkgver=6.19.0
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

md5sums=('22a53954e4e0ec258dfce4391e905dac')
md5sums_i686=('e812f6e8b155a9ed252253fe000f927f')
md5sums_x86_64=('651ca4b24da00776372f7f73fc6abfb6')
sha256sums=('62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a')
sha256sums_i686=('2b85ceb1dbd467fe249cd8fb949fb0badfb5e1677e75441ead4230e37ef3cdb5')
sha256sums_x86_64=('5032fb8ed097d4992d2584269c54fd192f7a1b71213b06fccfc3ae340b42d7ee')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install license.txt "$pkgdir/usr/share/doc/cf-cli/copyright"
}
