# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-ios
pkgver=2018.4.12f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
source=("2018.4.12f1.4.12f1.tar.xz::https://download.unity3d.com/download_unity/59ddc4c59b4f/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2018.4.12f1.tar.xz")
md5sums=("c5d2adbb4d47df826ddedc4d3f776edf")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

