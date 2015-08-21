# Maintainer: X0rg
# Contributor: Marcus Behrendt <marcus dot behrendt dot 86 [at] gmail dot com>
# Contributor: Pierrick BRUN <pierrick.brun gmail.com>

LO_DIR=/usr/lib/libreoffice/share/config/
pkgname=libreoffice-faenza-mod
pkgver=0.4.2
pkgrel=3
pkgdesc="An icons pack for LibreOffice, inspired by Faenza icons"
arch=('any')
url="http://gnome-look.org/content/show.php/Faenza+Icons++for+LibreOffice++4.0.0?content=157970"
license=('GPL')
depends=('libreoffice')
conflicts=('libreoffice-flat-icon-set')
install=$pkgname.install
source=("LibreOffice_Faenza_$pkgver.tar.xz::https://github.com/X0rg/AUR-PKGBUILD/blob/d9378ec6bae3941250bd8ad82266770d962f0a39/libreoffice-faenza-mod/LibreOffice_Faenza_$pkgver.tar.gz?raw=true")
md5sums=('fd0893791b93d989c6d8bdc7665f75c8')

prepare() {
	if [[ -z $LO_VER ]]; then
		msg2 "You can manually specify LibreOffice version with environnement variable 'LO_VER' if it fails."
	fi
}

package() {
	msg2 "Install Faenza icon theme for LibreOffice..."
	install -Dm644 "$srcdir/4.4/Faenza/images_crystal.zip" \
		"$pkgdir/$LO_DIR/images_faenza.zip"

	msg2 "Install Faenza Dark icon theme for LibreOffice..."
	install -Dm644 "$srcdir/4.4/Faenza_Dark/images_galaxy.zip" \
		"$pkgdir/$LO_DIR/images_faenza_dark.zip"
}
