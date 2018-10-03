# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.12
_build=f1
_randomstring=b582b87345b1
_prefix=/opt/UnityLts

pkgname=unity-editor-lts-doc
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Unity User Manual and Scripting API Reference."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("https://download.unity3d.com/download_unity/${_randomstring}/MacDocumentationInstaller/Documentation.pkg")
md5sums=('76103bb5fb1426a512871c22830ec6bb')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/Documentation.pkg.tmp/Payload" | gzip -dc | cpio -i
}

