# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-ios
pkgver=2019.2.17f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("2019.2.17f1.2.17f1.tar.xz::https://download.unity3d.com/download_unity/8e603399ca02/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.2.17f1.tar.xz")
md5sums=("fd245ed9a4648ace5b477fc1a9ee052e")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

