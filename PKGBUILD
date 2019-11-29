# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-windows
pkgver=2019.2.14f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Windows platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('cpio')
source=("2019.2.14f1.2.14f1.pkg::https://download.unity3d.com/download_unity/49dd4e9fa428/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2019.2.14f1.pkg")
md5sums=("f4fbba52fa1cc9d54655e1c6c052ea47")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

