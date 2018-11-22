# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=b11
_randomstring=45aaf16dbe1a
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
sha1sums=('aeb5933b19ad8410ef9057c0074552f3c36ac892')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data"
  install -d "${_dest}"
  mv "$(find "${srcdir}" -name Documentation)" "${_dest}"
}

