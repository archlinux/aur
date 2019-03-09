# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-ios
pkgver=2019.1.0b6
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("2019.1.0b6.1.0b6.tar.xz::https://beta.unity3d.com/download/e3cf6cb42b7c/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.1.0b6.tar.xz")
md5sums=("5db3389ca702cf8644de9c66fc61da27")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

