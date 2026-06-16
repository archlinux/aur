# Contributor: twa022 <twa022 at gmail dot com>

pkgname=violetumleditor
epoch=1
_pkgver=2.3.2
_snapshot=20260418
pkgver=${_pkgver}_${_snapshot}
pkgrel=1
pkgdesc="Java UML diagram editor"
arch=('any')
url="http://sourceforge.net/projects/violet"
license=('GPL2')
depends=('java-runtime>=17')
source=("${pkgname}-${pkgver}.deb::https://sourceforge.net/projects/violet/files/violetumleditor/${_pkgver}-SNAPSHOT/${pkgname}-${_pkgver}-SNAPSHOT.deb/download")
sha256sums=('994c0bc290d9d7427137b60fb289a55a738ff492f274a4850b163d1ea28316f2')

package() {
  bsdtar -x -f data.tar.gz -C "${pkgdir}"
  mkdir -p "${pkgdir}"/usr/bin/
  chmod a+x "${pkgdir}"/usr/share/${pkgname}/${pkgname}.sh
  ln -s /usr/share/${pkgname}/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
}
