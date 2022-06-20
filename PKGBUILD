# Maintainer: Yakumo Saki <yakumo at ziomatrix dot org>
pkgname=twty-bin
pkgver=0.0.13
pkgrel=5
epoch=
pkgdesc="Command-line twitter client"
arch=("x86_64")
url="https://github.com/mattn/twty"
license=('MIT')
groups=()
depends=()
makedepends=(wget)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/mattn/twty/releases/download/v${pkgver}/twty_v${pkgver}_linux_amd64.tar.gz")
noextract=("LICENSE")
md5sums=("c28d7e1a55950f6d1360eb362e13efed")
validpgpkeys=()
# TO VERSION UP 
# 1. Edit PKGBUILD(this file) pkgver and md5sums
#    md5sum can calculate by `md5sum target-filename.tar.gz`
#    beware md5sum of LICENSE is sometimes change.
# 2. Testing build using `makepkg -s`
# 3. Repeat edit and test to test passed. 
# 4. Create .SRCINFO by `makepkg --printsrcinfo > .SRCINFO`
# 5. git commit and git push
package() {
	_real_pkgname=twty
	cd $srcdir/${_real_pkgname}_v${pkgver}_linux_amd64
	mkdir -p $pkgdir/usr/bin
	cp twty $pkgdir/usr/bin
	chmod +x $pkgdir/usr/bin/twty

        # LICENSE file is changed everytime you download it. (to hide email address)
        # so, we dont check md5 of LICENSE
        wget -O $srcdir/LICENSE https://mattn.mit-license.org/2017
	install -D -m 644 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
