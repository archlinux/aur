# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-windows
pkgver=2018.3.2f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Windows platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('cpio')
source=("2018.3.2f1.3.2f1.pkg::https://download.unity3d.com/download_unity/b3c100a4b73a/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2018.3.2f1.pkg")
md5sums=("f0f9d748917c33f6d3d4289747a5e3e9")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

