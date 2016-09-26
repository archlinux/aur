# Maintainer: Paul Dunn <pwjdunn AT gmail DOT com>

pkgname=brouwhulp-bin
pkgver=5
pkgrel=1
pkgdesc="Dutch beer-brewing tool with recipes"
arch=('x86_64' 'i686')
license=()
url="http://wittepaard.roodetoren.nl/index.php?option=com_content&view=article&id=83"
options=()
source_x86_64=("brouwhulp::http://wittepaard.roodetoren.nl/index.php?option=com_docman&task=doc_download&gid=310&Itemid=13")
md5sums_x86_64=('SKIP')
source_i686=("brouwhulp::http://wittepaard.roodetoren.nl/index.php?option=com_docman&task=doc_download&gid=309&Itemid=13")
md5sums_i686=('SKIP')
source=("WhiteLabs.xml::http://wittepaard.roodetoren.nl/index.php?option=com_docman&task=doc_download&gid=314&Itemid=13")
md5sums=('SKIP')
makedepends=('xz')
depends=('qt4pas')
optdepends=('fann' 'lib32-qt4pas')
install="${pkgname}.install"
package() {
	cd "${srcdir}"
	ar x brouwhulp
	xz -d "${srcdir}"/data.tar.xz
	tar -xf "${srcdir}/data.tar"
	cp -dr --no-preserve=ownership ${srcdir}/usr ${pkgdir}/usr
	cp --no-preserve=ownership ${srcdir}/WhiteLabs.xml ${pkgdir}/usr/share/brouwhulpdata/White\ Labs.xml
}
