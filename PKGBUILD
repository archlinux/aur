# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-ios
pkgver=2019.3.0b8
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("2019.3.0b8.3.0b8.tar.xz::https://beta.unity3d.com/download/7eb5456f98b4/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.3.0b8.tar.xz")
md5sums=("7345da765e256b81ee33f289ef19d130")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

