# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>
# Retrieved from
# https://gitlab.manjaro.org/packages/community/microsoft-office-online-jak.git

pkgname=('ms-office-online')
pkgver=2.1.1
pkgrel=1
epoch=2
_commit=8c3875783544528a1efe303a55cb24b9b9c22045
pkgdesc="Microsoft Office Suite Online as a native application"
url="https://www.office.com/"
depends=('jade-application-kit>=3.0.0')
license=('GPL3' 'CC')
arch=('any')
#replaces=('ms-office-online')
#conflicts=('ms-office-online')
source=("https://gitlab.manjaro.org/applications/ms-office-online-launcher/-/archive/$_commit/ms-office-online-launcher-$_commit.tar.gz")
sha256sums=('3f54bd7798b56c8b052c4f0100a12cad9a5d65469b95bba107cb2a8122efa792')

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
