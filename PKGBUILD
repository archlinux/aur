# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=zeit-now-bin
pkgver=15.8.7
pkgrel=1
epoch=
pkgdesc="Realtime Global Deployments by Zeit, pre-built binary (outdated)"
arch=("x86_64")
url="https://zeit.co/now"
# license is according to https://www.npmjs.com/package/now
license=("Apache")
groups=()
depends=("glibc")
makedepends=("gzip")
checkdepends=()
optdepends=()
provides=("zeit-now")
conflicts=("nodejs-now")
replaces=()
backup=()
options=("!strip")
install=
changelog=
source=("https://github.com/zeit/now-cli/releases/download/${pkgver}/now-linux.gz")
noextract=()
md5sums=('cb106ea0f55d81877cd2368168da9678')
validpgpkeys=()

build() {
	# XXX why is this required? It was not required before auto-update
	gunzip < now-linux.gz > now-linux
	chmod +x now-linux
}

package() {
	install -D now-linux "${pkgdir}/usr/bin/now"
}
