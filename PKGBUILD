# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: sxe <sxxe@gmx.de>

pkgname=kio_recoll
pkgver=1.21.6
pkgrel=1
pkgdesc="KDE4 KIO Slave for recoll a full text search tool based on Xapian backend"
arch=('i686' 'x86_64')
url="http://www.lesbonscomptes.com/recoll/"
license=('GPL')
depends=('xapian-core>=1.0.15-1' 'qt4' 'openssl' 'hicolor-icon-theme' 'automoc4')
makedepends=('cmake' 'extra-cmake-modules')
optdepends=('unzip: for the OpenOffice.org documents'
            'xpdf: for pdf'
            'pstotext: for postscipt'
            'antiword: for msword'
            'catdoc: for ms excel and powerpoint'
            'unrtf: for RTF'
            'tetex: for dvi support with dvips'
            'djvulibre: for djvu'
            'id3lib: for mp3 tags support with id3info'
            'python2: for using some filters')

source=("http://www.lesbonscomptes.com/recoll/recoll-${pkgver}.tar.gz")
md5sums=('4fb2834d9f761dc3e07ce8569dd4677a')

build() {
    cd "${srcdir}/recoll-${pkgver}/kde/kioslave/kio_recoll"

    cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr
    make
}

package() {
    cd "${srcdir}/recoll-${pkgver}/kde/kioslave/kio_recoll"
    make DESTDIR="${pkgdir}" install
}
