# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Flucke <tflucke@protonmail.com>
pkgname=magicseteditor-full-magic-pack-git
pkgver=2.5.8
pkgrel=1
epoch=
pkgdesc="Pack containing nearly all public Magic templates for MSE, except outdated ones."
arch=("any")
url="https://magicseteditor.com/"
license=('GPL-2.0-only')
groups=()
depends=()
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
_commit=d5a825b6c08d5a9b092b54595a33a84facf49ae1
source=("${pkgname}-${_commit}.tar.gz::https://codeload.github.com/MagicSetEditorPacks/Full-Magic-Pack/tar.gz/$_commit")
noextract=()
sha256sums=('d05d5d59a272610ad13e5fc2048688913277e7a3cf586673b9ec320ac489fc5e')
validpgpkeys=()

package() {
	cd "Full-Magic-Pack-$_commit"
	mkdir -p $pkgdir/usr/share/magicseteditor/data ${pkgdir}/usr/share/fonts/mse/
	cp -r data/* "${pkgdir}/usr/share/magicseteditor/data"
    rm -r "${pkgdir}"/usr/share/magicseteditor/data/{ch-s,ch-t,da,de,en,es,fr,it,jp,ko,pl,pt-br,ru}.mse-locale
    cp -r "Magic - Fonts"/* "${pkgdir}/usr/share/fonts/mse"
}
