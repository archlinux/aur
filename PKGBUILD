# Maintainer: AbrarSyed <sacabrarsyed g-mail>
pkgname=cloudfoundry-cli
pkgver=6.12.4
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
md5sums_i686=('1d4e10df5db7810665807f68740cc0b8')
md5sums_x86_64=('92693dfbaef7022ace7e5c616b3197a9')
sha256sums=('1c57a832ebd8d56c3ed8480a9514a89bce25f35458a018e0ac30a5429c56cf8f')
sha256sums_i686=('2617c09aaa5810a39cbbb878bffa3ca1456158266f9104131935a5288ebaf8d2')
sha256sums_x86_64=('dc1b7f3c5da3ca678831cfcf6127811d48048c6534c8655db7fbe8acacf8b411')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install license.txt "$pkgdir/usr/share/doc/cf-cli/copyright"
}
