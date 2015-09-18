# Maintainer: AbrarSyed <sacabrarsyed g-mail>
pkgname=cloudfoundry-cli
pkgver=6.12.3
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
md5sums_i686=('ff65dec1399aef20c549665c34464d00')
md5sums_x86_64=('35bb66161735eeafa3c443ae0589ff47')
sha256sums=('1c57a832ebd8d56c3ed8480a9514a89bce25f35458a018e0ac30a5429c56cf8f')
sha256sums_i686=('a31aae0a0c708d5c467842adbd9770275e80d1133f4ee3e2010debf1018f4d92')
sha256sums_x86_64=('35d00a50b6f5c70e5bc8069d0669d399f6c2605f02b7e6f8c008df365a4afaea')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install license.txt "$pkgdir/usr/share/doc/cf-cli/copyright"
}
