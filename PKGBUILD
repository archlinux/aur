# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-facebook
pkgver=2019.1.10f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Facebook-Games platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('cpio')
source=("2019.1.10f1.1.10f1.pkg::https://download.unity3d.com/download_unity/f007ed779b7a/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-2019.1.10f1.pkg")
md5sums=("27cddf47727104bbc05ca973d7812772")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/Facebook"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

