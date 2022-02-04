# Maintainer: Jeremy MountainJohnson <jskier@gmail.com>
# Contributor: Jeremy MountainJohnson <jskier@gmail.com>

pkgname=xfce-classiclooks
pkgver=2.2.0
pkgrel=2
pkgdesc="The Xfce Evolution theme attempts to rid the Xfce desktop of visual distractions by providing a more consistent look (buttons, scrollbars, menus, etc) across older and newer applications."
arch=('any')
url="https://sourceforge.net/projects/classiclooks/"
license=(GPLv2)
depends=(gtk-engine-murrine)
optdepends=(lib32-gtk-engine-murrine qt5-styleplugins noto-fonts elementary-xfce-icons nemo)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/JSkier21/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('b0ba8631303a338c33b34963a0e6b991514ac6012829ce968d5c0d22ad3d3ebbefbf965258fbe2070ba1b0d39f73843ff656c411ff7cec5602f348215c89cb18')

package() {
    # Prepare all theme directories for package
    for i in ${srcdir}/xfce-classiclooks-$pkgver/ClassicLooks*; do
	    if [ -d "$i" ]; then
		    echo $i
		    install -dm 755 "$pkgdir/usr/share/themes/${i##*/}"
    		    cp -rp "$i" "$pkgdir/usr/share/themes/"
	    fi
    done
}
