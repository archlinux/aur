# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-mac
pkgver=2019.1.8f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Mac platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('cpio')
source=("2019.1.8f1.1.8f1.pkg::https://download.unity3d.com/download_unity/7938dd008a75/MacEditorTargetInstaller/UnitySetup-Mac-Mono-Support-for-Editor-2019.1.8f1.pkg")
md5sums=("d9f9d7af96b02035dc2f0c314614bdbf")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/MacStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

