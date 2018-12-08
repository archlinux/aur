# Maintainer: AbrarSyed <aur@abrarsyed.com>
pkgname=cloudfoundry-cli
pkgver=6.41.0
pkgrel=1
pkgdesc="The official command line client for Cloud Foundry"
arch=('x86_64')
url="https://github.com/cloudfoundry/cli"
license=('Apache')
provides=()
options=('!emptydirs' '!strip')

source=("cf-cli-${pkgver}-amd64.tar.gz::https://cli.run.pivotal.io/stable?release=linux64-binary&version=${pkgver}&source=github-rel")

md5sums=('1d9649a0f6eadb2d28cc12a07c07708c')
sha256sums=('eedf8567e6a94570ccabc51653eec2a4c739702e03997e21ebfd2f855bb8c18c')
sha512sums=('0a9ab69a4d70a63324b45bba6d415a0f17fc218d07dfcd863dff9c798b9520262e2588493fdfd6f9533f870520feaf6ac864e18d31b08202335607fc97335661')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license & notice
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install $srcdir/LICENSE "$pkgdir/usr/share/doc/cf-cli/LICENSE"
	install $srcdir/NOTICE "$pkgdir/usr/share/doc/cf-cli/NOTICE"
}

