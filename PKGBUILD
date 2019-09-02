# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-mac
pkgver=2019.2.3f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Mac platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('cpio')
source=("2019.2.3f1.2.3f1.pkg::https://beta.unity3d.com/download/8e55c27a4621/MacEditorTargetInstaller/UnitySetup-Mac-Mono-Support-for-Editor-2019.2.3f1.pkg")
md5sums=("b4f6d9d2fe1f9505958a3f12967c4a52")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/MacStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

