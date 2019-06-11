# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-ios
pkgver=2019.1.6f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("2019.1.6f1.1.6f1.tar.xz::https://download.unity3d.com/download_unity/f2970305fe1c/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.1.6f1.tar.xz")
md5sums=("d1c5eae69004378176bb331fd5663d75")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

