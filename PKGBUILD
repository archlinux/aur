# Maintainer: AbrarSyed <aur@abrarsyed.com>
pkgname=cloudfoundry-cli
pkgver=7.0.2
pkgrel=1
pkgdesc="The official command line client for Cloud Foundry"
arch=('x86_64')
url="https://github.com/cloudfoundry/cli"
license=('Apache')
provides=()
options=('!emptydirs' '!strip')

source=("cf-cli-${pkgver}-amd64.tar.gz::https://cli.run.pivotal.io/stable?release=linux64-binary&version=${pkgver}&source=github-rel")

md5sums=('d78ecd112a0ee957d6706d0ef1826a79')
sha256sums=('d569844ca0cd564476749cde2479fd538823a8600337d04d3b1f1f4dbdb0f762')
sha512sums=('2cdb0e77228316ffd37ce123b6e5240c205c50c3dfde623dcbd8645643baf3d314396cc830d7eceda4cf8c3959b1aa3b284548b202dc7508ef1c2d02a3ccb74d')

package() {
    # copy binary
	mkdir -p "$pkgdir/usr/bin"
	install $srcdir/cf "$pkgdir/usr/bin"

	#copy license & notice
	mkdir -p "$pkgdir/usr/share/doc/cf-cli"
	install $srcdir/LICENSE "$pkgdir/usr/share/doc/cf-cli/LICENSE"
	install $srcdir/NOTICE "$pkgdir/usr/share/doc/cf-cli/NOTICE"
}

