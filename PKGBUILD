# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-facebook
pkgver=2019.2.3f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Facebook-Games platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
makedepends=('cpio')
source=("2019.2.3f1.2.3f1.pkg::https://beta.unity3d.com/download/8e55c27a4621/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-2019.2.3f1.pkg")
md5sums=("514abf70a59a425bc0b98340ea4995b6")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/Facebook"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

