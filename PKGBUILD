# Maintainer: AbrarSyed <sacabrarsyed g-mail>
pkgname=cloudfoundry-cli
pkgver=6.13.0
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

md5sums=('cbb45add8fd7cba6cdf4dcdad47bacc9')
md5sums_i686=('90e91c670d65af636efaba5938c4c049')
md5sums_x86_64=('cd5625dfc2ec41de540013297fa772e2')
sha256sums=('1c57a832ebd8d56c3ed8480a9514a89bce25f35458a018e0ac30a5429c56cf8f')
sha256sums_i686=('ec92de5089a6521265d21437fea90f8f70bc22bc820a336d0a9a6b82ffe854c4')
sha256sums_x86_64=('141248c34fc16d3b3672af1b7ff3177855a895446c64667b851b11a2e4fdb6b0')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install license.txt "$pkgdir/usr/share/doc/cf-cli/copyright"
}
