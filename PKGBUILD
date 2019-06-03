# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-facebook
pkgver=2019.1.5f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Facebook-Games platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('cpio')
source=("2019.1.5f1.1.5f1.pkg::https://download.unity3d.com/download_unity/6f1140cf2297/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-2019.1.5f1.pkg")
md5sums=("61bab81465a99c0cf4b084b97fda8bcf")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/Facebook"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

