# Maintainer: Michael Serpieri <mickybart@pygoscelis.org>

pkgname=smb4k-kf5
_pkgname=smb4k
pkgver=1.9.90
pkgrel=1
pkgdesc="A KDE program that browses samba shares (beta release of the upcoming KF5-based Smb4K 2.0)"
arch=('i686' 'x86_64')
url="http://smb4k.sourceforge.net/"
license=('GPL')
depends=('knewstuff')
makedepends=('extra-cmake-modules'
             'kdoctools')
conflicts=('smb4k')
replaces=('smb4k')
source=("http://downloads.sourceforge.net/project/${_pkgname}/Development/${_pkgname}-${pkgver}.tar.xz")
md5sums=('4bfd740d770809a81222137336a28670')

build() {
  cd ${_pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RELEASE \
	-DKDE_INSTALL_LIBDIR=lib \
        -DINSTALL_PLASMOID=OFF
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
