## Maintainer: realasking
pkgname=kimtoy-kde4
pkgver=1.10.1
pkgrel=1
pkgdesc='KIMToy is an input method frontend for KDE, this version can be run at both kde4 and kde5 without segmentation fault'
arch=(x86_64 i686)
url='http://kde-apps.org/content/show.php?content=140967'
license=('GPL')
depends=('cmake>=2.6' 'qt4>=4.6' 'kdelibs>=4.5' 'qca-qt4>2.0' 'gettext')
optdepends=('ibus: ibus chinese input method support'
            'scim: scim chinese input method support')
conflicts=('kimtoy')
provides=('kimtoy')
install="${pkgname}.install"
source=(
	'https://github.com/KDE/kimtoy/archive/kde4.zip'
)
md5sums=('64d96f70206f0d1a8073a1a7f4d6d5a6')

build() {
	mkdir -p "${srcdir}/kimtoy-kde4/build"
	cd "${srcdir}/kimtoy-kde4/build"
	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
	make
}

package() {
	cd "${srcdir}/kimtoy-kde4/build"
	make DESTDIR="${pkgdir}" install
}
