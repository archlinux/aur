# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.13
_build=f1
_randomstring=83fbdcd35118
_prefix=/opt/Unity

pkgname=unity-editor-doc
pkgver=${_version}${_build}
pkgrel=2
pkgdesc="Unity User Manual and Scripting API Reference."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("https://docs.unity3d.com/2018.2/Documentation/uploads/UnityDocumentation.zip")
sha1sums=('0e583e0b88adf1824403f07c8d4f76cdf600691c')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data"
  install -d "${_dest}"
  mv "$(find "${srcdir}" -name Documentation)" "${_dest}"
}

