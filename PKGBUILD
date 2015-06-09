# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Jarek Sedlacek <JarekSedlacek@gmail.com>
pkgname=kgmailnotifier
pkgver=0.5.2
pkgrel=8
pkgdesc="A gmail notifier systray applet for KDE."
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php/KGmailNotifier?content=55375"
license=('GPL')
depends=('kdebase-runtime' 'kdeutils-kwalletmanager')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install
changelog=ChangeLog
source=("http://opendesktop.org/CONTENT/content-files/55375-${pkgname}-${pkgver}.tar.gz")
md5sums=('1a05357487076972040fdac510d8434e')

build() {
    cd "${srcdir}/${pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
}

