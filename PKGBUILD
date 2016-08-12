# Maintainer: AbrarSyed <sacabrarsyed g-mail>
pkgname=cloudfoundry-cli
pkgver=6.21.1
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
md5sums_i686=('78ee9415b05c6efc4551b972a99b44ab')
md5sums_x86_64=('cdaab0ef3884c4e53f4263d6dfbaf33c')
sha256sums=('62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a')
sha256sums_i686=('fcdaf5b956db8fe6f1231edfebf85976940a2a88441a6ec52dd3a616d4f3fded')
sha256sums_x86_64=('a90be63743700679280d34be1193d4ba9d289c5a14cb0546d750eb813d38bf29')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install license.txt "$pkgdir/usr/share/doc/cf-cli/copyright"
}
