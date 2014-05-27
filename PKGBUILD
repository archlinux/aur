# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/wacom-utility

pkgname=wacom-utility
pkgver=1.21
_uprel=3
pkgrel=5
pkgdesc="Graphical tablet configuration utility"
arch=('i686' 'x86_64')
url='http://gtk-apps.org/content/show.php/Wacom+Control+Panel?content=llll104309'
license=('GPL')
depends=('gtk2' 'python2' 'pygtk' 'xf86-input-wacom' 'gksu')
source=("http://ppa.launchpad.net/hughescih/ppa/ubuntu/pool/main/w/${pkgname}/${pkgname}_${pkgver}-${_uprel}.tar.gz"
    'wacom-utility.desktop')

md5sums=('51ff9257b6e0c511ee57d40cd76742ec'
         '1d44b3571fd5e48b80b2dec5209fcf47')
package() {
    cd "$srcdir/$pkgname"
    mkdir -p "${pkgdir}/usr/share/applications"
    install -Dm755 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    find \( -regex '.*\.\(py\|png\|xml\|glade\)' -or -name 'keymap.txt' \) \
        -exec install -D {} "${pkgdir}/usr/share/${pkgname}/{}" \;
}
