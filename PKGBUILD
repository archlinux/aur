# Maintainer: AbrarSyed <sacabrarsyed g-mail>
pkgname=cloudfoundry-cli
pkgver=6.22.2
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

md5sums=('2ee41112a44fe7014dce33e26468ba93')
md5sums_i686=('32ccd46c24c7750d01d1d9b3ae3ebc2b')
md5sums_x86_64=('17e7ceef9200faa30bcbb502ab6b96db')
sha256sums=('0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594')
sha256sums_i686=('c4bf62f85ee901acf96936fdf32c259f1ca4b4192d2da212afc91a8f851cf7c8')
sha256sums_x86_64=('8ecd65da834f43282c53ef3bd79df22faf08dc3465c8625e897c7d32994cb409')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install license.txt "$pkgdir/usr/share/doc/cf-cli/copyright"
}
