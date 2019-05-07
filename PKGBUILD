# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-ios
pkgver=2019.2.0a14
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("2019.2.0a14.2.0a14.tar.xz::https://beta.unity3d.com/download/f7ca70490e38/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.2.0a14.tar.xz")
md5sums=("d2bcc103bf4a32bb5e8e4a5e96997788")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

