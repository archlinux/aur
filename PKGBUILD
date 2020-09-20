# Maintainer: 

pkgname=ddrescueview-bin
_pkgname=ddrescueview
pkgver=0.4~alpha4
_pkgverurl=0.4%20alpha%204
pkgrel=1
pkgdesc="Graphical viewer for GNU ddrescue log files"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ddrescueview"
license=('GPL')
provides=(ddrescueview)
conflicts=(ddrescueview)
depends=('gtk2')
makedepends=('unzip')

case ${CARCH} in
  i686)
    _bldarch='i386'
    sha512sums=('f09a460bcbc7dfc424d962d6d7e7d133c01c531b14a272c9113243fc6aab0e5a5107440ec4826269f5e02ebbfefc391ae49c5a76735b6a72296b59af26ea535f')
    ;;
  x86_64)
    _bldarch='x86_64'
    sha512sums=('68ad638105eeecb241f9d4345d2048f0d459908c70967f47ebdbc2441e3ec946b8f181de3f7006a02106a5b991e64d3d23116d8a71f579bd99cfcca2910b0dde')
    ;;
esac

base_file_name="${_pkgname}-linux-${_bldarch}-${pkgver}"
source=(https://downloads.sourceforge.net/project/${_pkgname}/Test%20builds/v${_pkgverurl}/Linux-${_bldarch}/${base_file_name}.tar.xz)

package() {
  cd "$base_file_name"
  install -D -m 755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
}
