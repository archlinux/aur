# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-windows
pkgver=2019.2.10f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Windows platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('cpio')
source=("2019.2.10f1.2.10f1.pkg::https://download.unity3d.com/download_unity/923acd2d43aa/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2019.2.10f1.pkg")
md5sums=("44b2b90e777c1739389346e9e01056e8")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

