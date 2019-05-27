# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-ios
pkgver=2019.1.4f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("2019.1.4f1.1.4f1.tar.xz::https://download.unity3d.com/download_unity/ffa3a7a2dd7d/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.1.4f1.tar.xz")
md5sums=("b83223f5a1fa6f07b00ef0f9b1925c55")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

