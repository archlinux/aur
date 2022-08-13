pkgname=mentohust-git
pkgver=4.0.alpha2.r43.g857f5a1
pkgrel=1
pkgdesc="A Ruijie V4 supplicant on Linux and MacOS"
arch=('any')
license=('GPL')
url="https://github.com/hyrathb/mentohust"
depends=('libpcap')
optdepends=('libnotify')
makedepends=('git')
provides=('mentohust')
conflicts=('mentohust')
source=('git+https://github.com/hyrathb/mentohust.git')
sha256sums=('SKIP')
install=$pkgname.install

build()
{
    cd mentohust
    ./autogen.sh
    ./configure
    make
}

pkgver() {
    cd mentohust
    git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
    cd mentohust
    make install DESTDIR="${pkgdir}"
}

