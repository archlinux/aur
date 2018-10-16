# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.13
_build=f1
_randomstring=6902ad48015d
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
md5sums=('0dbb155a5e6b2fff8848e71f088a4b4a')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/Documentation.pkg.tmp/Payload" | gzip -dc | cpio -i
}

