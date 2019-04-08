# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-ios
pkgver=2018.3.11f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("2018.3.11f1.3.11f1.tar.xz::https://download.unity3d.com/download_unity/5063218e4ab8/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2018.3.11f1.tar.xz")
md5sums=("eca9a42ba9af5887e60f3485f62960ea")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

