# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>
# Retrieved from
# https://gitlab.manjaro.org/packages/community/microsoft-office-online-jak.git

pkgname=('ms-office-online')
pkgver=20.1.0
pkgrel=1
#epoch=1
_commit=f0be4ad4886df7a8c346efcfca82337e5e97e835
pkgdesc="Microsoft Office Suite Online as a native application"
url="https://www.office.com/"
depends=('jade-application-kit>=3.0.0')
license=('GPL3' 'CC')
arch=('any')
replaces=('ms-office-online')
conflicts=('ms-office-online')
source=("https://gitlab.manjaro.org/applications/ms-office-online-launcher/-/archive/$_commit/ms-office-online-launcher-$_commit.tar.gz")
sha256sums=('4bcea8753c296148f605519e4c3d3fd0362d24cc02dbb581db288abe805e75b6')

prepare() {
    mv "ms-office-online-launcher-$_commit" "ms-office-online-launcher-$pkgver" 
}

package() {
    cd "ms-office-online-launcher-${pkgver}"
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/{applications,pixmaps}
    cp launcher.desktop $pkgdir/usr/share/applications/ms-office-online.desktop
    cp icons/office.png $pkgdir/usr/share/pixmaps/ms-office.png
    cp ms-office-online $pkgdir/usr/bin
    chmod a+x $pkgdir/usr/bin/ms-office-online
}
