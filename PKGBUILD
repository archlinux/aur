# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=birthday
pkgver=1.6.2
pkgrel=2
pkgdesc="A program that outputs reminders for upcoming events (e.g. birthdays)"
url="https://sourceforge.net/projects/birthday/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('glibc')
source=("https://downloads.sourceforge.net/project/birthday/birthday/${pkgver}/birthday-${pkgver}.tar.bz2")
sha256sums=('355ad07ad3312d8f5c5b54c71596ac3a0e706c539167900d73cb65df30c8e2f4')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" SHARE="/share" install
}
