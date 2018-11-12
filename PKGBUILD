# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.15
_build=f1
_randomstring=65e0713a5949
_prefix=/opt/Unity

pkgname=unity-editor-doc
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Unity User Manual and Scripting API Reference."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("https://docs.unity3d.com/2018.2/Documentation/uploads/UnityDocumentation.zip")
sha1sums=('8dbc8d124853ee9797aca29683c5d9086e28e29b')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data"
  install -d "${_dest}"
  mv "$(find "${srcdir}" -name Documentation)" "${_dest}"
}

