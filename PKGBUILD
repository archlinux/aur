# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-doc
pkgver=2017.4.27f1
pkgrel=1
pkgdesc="Unity User Manual and Scripting API Reference."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("2017.4.27f1.pkg::https://download.unity3d.com/download_unity/0c4b856e4c6e/MacDocumentationInstaller/Documentation.pkg")
md5sums=("2489a4af042db53e8a1a582530b1752f")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/Documentation.pkg.tmp/Payload" | gzip -dc | cpio -i
}

