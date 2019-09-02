# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-ios
pkgver=2019.3.0b1
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("2019.3.0b1.3.0b1.tar.xz::https://beta.unity3d.com/download/78e106a973e1/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.3.0b1.tar.xz")
md5sums=("0db7cf7adbb30701003b9b46c3d8f6c6")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

