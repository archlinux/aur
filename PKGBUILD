# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-ios
pkgver=2017.4.25f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
source=("2017.4.25f1.4.25f1.tar.xz::https://download.unity3d.com/download_unity/9cba1c3a94f1/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2017.4.25f1.tar.xz")
md5sums=("cbe6d6646c52415ec13a4c97f5d4aa69")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

