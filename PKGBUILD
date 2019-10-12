# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-ios
pkgver=2019.2.9f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("2019.2.9f1.2.9f1.tar.xz::https://download.unity3d.com/download_unity/ebce4d76e6e8/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.2.9f1.tar.xz")
md5sums=("d8e4f2289c8c583370f82e7ffbcf14ba")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

