# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-doc
pkgver=2017.4.20f1
pkgrel=1
pkgdesc="Unity User Manual and Scripting API Reference."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("2017.4.20f1.pkg::https://download.unity3d.com/download_unity/20968fa45e51/MacDocumentationInstaller/Documentation.pkg")
md5sums=("549ec9831e959038b8c01d239b97d233")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/Documentation.pkg.tmp/Payload" | gzip -dc | cpio -i
}

