# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-doc
pkgver=2017.4.20f2
pkgrel=1
pkgdesc="Unity User Manual and Scripting API Reference."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("2017.4.20f2.pkg::https://download.unity3d.com/download_unity/413dbd19b6dc/MacDocumentationInstaller/Documentation.pkg")
md5sums=("b9cd6b69619a4cbe6d2e24879e6b6dfe")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/Documentation.pkg.tmp/Payload" | gzip -dc | cpio -i
}

