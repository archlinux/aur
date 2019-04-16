# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-ios
pkgver=2019.1.0f2
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("2019.1.0f2.1.0f2.tar.xz::https://beta.unity3d.com/download/292b93d75a2c/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.1.0f2.tar.xz")
md5sums=("4a6628b549c12a944ac1924b00570b59")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

