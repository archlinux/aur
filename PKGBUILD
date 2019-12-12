# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-doc
pkgver=2018.4.14f1
pkgrel=1
pkgdesc="Unity User Manual and Scripting API Reference."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("2018.4.14f1.zip::https://storage.googleapis.com/docscloudstorage/2018.4/UnityDocumentation.zip")
md5sums=("SKIP")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/Documentation.pkg.tmp/Payload" | gzip -dc | cpio -i
}

