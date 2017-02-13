# Maintainer: Andreas Linz <alinz@klingt.net>

pkgname=adapta-gtk-theme-deb
_gtk_version='3.89.3.117'
_git_patch_release=''
_package_version="${_gtk_version}${_git_patch_release}-0"
pkgver="${_gtk_version}"
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines.'
arch=(any)
url='https://github.com/tista500/Adapta'
license=('GPL' 'custom:CC-BY-SA-3.0+')
depends=()
provides=('adapta-gtk-theme')
conflicts=('adapta-gtk-theme')
makedepends=()
optdepends=()
source=("https://launchpad.net/~tista/+archive/ubuntu/adapta/+files/adapta-gtk-theme_${_package_version}ubuntu1~yakkety1_all.deb")
md5sums=('884ebd294bfd8e0a02460570781ce2a6')

package() {
    bsdtar -Oxf $srcdir/adapta-gtk-theme_${_package_version}ubuntu1~yakkety1_all.deb --include data.tar.xz  | tar -C $pkgdir -Jxf -
    install -m 755 -d $pkdir/usr/share /usr/share
    install -D -m644 ${pkgdir}/usr/share/themes/Adapta/LICENSE_CC_BY_SA4 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -r $pkgdir/usr/share/doc
}
