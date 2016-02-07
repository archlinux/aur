# Maintainer: AbrarSyed <sacabrarsyed g-mail>
pkgname=cloudfoundry-cli
pkgver=6.15.0
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
md5sums_i686=('db2d6ec45d049a7322040e4d799f42dc')
md5sums_x86_64=('7824590ec0c205457662cfb5decd5850')
sha256sums=('1c57a832ebd8d56c3ed8480a9514a89bce25f35458a018e0ac30a5429c56cf8f')
sha256sums_i686=('a470b6fe08d59a2ccfac89e34de22759be3e66d1a0816048c20d50dfc892eecd')
sha256sums_x86_64=('00fd60f9f1e2ed46811efe3376d6ddad0fd65f7ed107ba370f0ee6ae871d36bc')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install license.txt "$pkgdir/usr/share/doc/cf-cli/copyright"
}
