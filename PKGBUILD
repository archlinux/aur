# Maintainer: AbrarSyed <sacabrarsyed g-mail>
pkgname=cloudfoundry-cli
pkgver=6.12.2
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
md5sums_i686=('e7fc3767977900bb11c301b33827690a')
md5sums_x86_64=('9182661e3518a3c0ac19f247dd01a23b')
sha256sums=('1c57a832ebd8d56c3ed8480a9514a89bce25f35458a018e0ac30a5429c56cf8f')
sha256sums_i686=('474af7f0df79069d0beddfab1cc3503672b3ea5d12c20fd7cc780ec6d3fa6067')
sha256sums_x86_64=('64180899f0962f2f0ad58d46c0f522fe2d0deec5024bbbc5ce2c765f8bc03de7')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install license.txt "$pkgdir/usr/share/doc/cf-cli/copyright"
}
