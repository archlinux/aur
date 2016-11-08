pkgname=mentohust-git
pkgver=fd0da07
pkgrel=1
pkgdesc="A Ruijie V4 supplicant on Linux and MacOS"
arch=('any')
license=('GPL')
url="https://github.com/hyrathb/mentohust"
depends=('libpcap')
optdepends=('libnotify')
makedepends=('autoconf' 'automake' 'make' 'gcc' 'git')
source=('git://github.com/hyrathb/mentohust.git')
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
    printf "%s" "$(git describe --always | sed 's/-/_/g')"
}

package()
{
    cd mentohust
    make install DESTDIR="${pkgdir}"
}

