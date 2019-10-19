# Maintainer: Emile de Weerd <emile@deweerd.fr>
pkgname='rtm-cli'
pkgver='1.5.1'
pkgrel=1
epoch=
pkgdesc="CLI to Remember the Milk API"
arch=('any')
url="https://github.com/dwaring87/rtm-cli/blob/master/README.md"
license=('MIT')
groups=()
depends=('nodejs'
        'npm')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/dwaring87/rtm-cli/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('cf24c4190f777f940ee5a0af1540e44f')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	npm install
}

package() {
	cd "$pkgname-$pkgver"
	npm pack .
	npm install -g --prefix "$pkgdir/usr/" $pkgname-$pkgver.tgz
}
