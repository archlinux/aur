# Maintainer: Yakumo Saki <yakumo at ziomatrix dot org>
pkgname=lambroll-bin
pkgver=0.14.6
pkgrel=1
epoch=
pkgdesc="Minimal deployment tool for AWS Lambda."
arch=("x86_64")
url="https://github.com/fujiwara/lambroll"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('aws-cli: create aws login info')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fujiwara/lambroll/releases/download/v${pkgver}/lambroll_v${pkgver}_linux_amd64.tar.gz")
noextract=()
md5sums=("c0983306984caf76cf80c5b79ddfafe0")
validpgpkeys=()
# TO VERSION UP 
# 1. Edit PKGBUILD(this file) pkgver and md5sums
#    md5sum can calculate by `md5sum target-filename.tar.gz`
# 2. build by `makepkg -s`
# 3. create .SRCINFO by `makepkg --printsrcinfo > .SRCINFO`
# 4. git commit and git push
package() {
	_real_pkgname=lambroll
	cd $srcdir/${_real_pkgname}_v${pkgver}_linux_amd64
	mkdir -p $pkgdir/usr/bin
	cp lambroll $pkgdir/usr/bin
	chmod +x $pkgdir/usr/bin/lambroll
	install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
