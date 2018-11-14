# Maintainer: Moritz Patelscheck <moritz(at)patelscheck.de>
_pkgname=passmate
pkgname=passmate-server
pkgver=v0.4.alpha
pkgrel=1
epoch=
pkgdesc="a cross-platform, open-source password manager"
arch=('i686' 'x86_64')
url="https://github.com/TobiasKaiser/passmate"
license=('Apache')
groups=()
depends=('python2' 'python2-pycryptodome')
makedepends=('git' 'sed')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/TobiasKaiser/passmate.git)
noextract=()
md5sums=('SKIP')

prepare() {
	cd "$_pkgname/server"
	sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/' "server.py"
}

package() {
	cd "$_pkgname/server"
	install -Dm755 "server.py" "${pkgdir}/usr/bin/${pkgname}"
}
