# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-ios
pkgver=2018.3.8f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("2018.3.8f1.3.8f1.tar.xz::https://download.unity3d.com/download_unity/fc0fe30d6d91/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2018.3.8f1.tar.xz")
md5sums=("cdd08c300482919efe3c0b66956ceced")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

