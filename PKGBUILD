# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=b3
_randomstring=cc0086a8e10c
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-doc
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Unity User Manual and Scripting API Reference."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("https://docs.unity3d.com/2018.3/Documentation/uploads/UnityDocumentation.zip")
sha1sums=('89730f4d24a14667d7c6151e822a5644439c075d')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data"
  install -d "${_dest}"
  mv "$(find "${srcdir}" -name Documentation)" "${_dest}"
}

