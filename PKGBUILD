# Maintainer: 

pkgname=ddrescueview-bin
_pkgname=ddrescueview
pkgver=0.4.5
_pkgverurl=0.4.5
pkgrel=1
pkgdesc="Graphical viewer for GNU ddrescue log files"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ddrescueview"
license=('GPL')
provides=(ddrescueview)
conflicts=(ddrescueview)
depends=('gtk2')
makedepends=('unzip')

sha512sums_x86_64=('2a56488f1369a720ef1f119f941f456e121212a70ca52daa1e6ffa1d47898caf6a21218e41ec5ad02152b03ccc96ba6e050113d4d2ef4a2635ac5d5b467fd1dd')
sha512sums_i686=('314288d7b693a4bc4dd63a197fbbe9b735d28a2fe68139770ec1389c02f6c1a4eea4e8bbb0d4d6811ab211edc9b0ab779d00dec0a330c23b0bc40d3e44fd5506')

source_x86_64=(https://downloads.sourceforge.net/project/${_pkgname}/Test%20builds/v${_pkgverurl}/Linux-x86_64/${_pkgname}-linux-x86_64-${pkgver}.tar.xz)
source_i686=(https://downloads.sourceforge.net/project/${_pkgname}/Test%20builds/v${_pkgverurl}/Linux-i386/${_pkgname}-linux-i386-${pkgver}.tar.xz)

package() {
  case ${CARCH} in
    i686)
      _bldarch='i386'
      ;;
    x86_64)
      _bldarch='x86_64'
      ;;
  esac

  base_file_name="${_pkgname}-linux-${_bldarch}-${pkgver}"
  
  cd "$base_file_name"
  install -D -m 755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
}
