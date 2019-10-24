# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-mac
pkgver=2019.3.0b8
pkgrel=1
pkgdesc="Allows building your Unity projects for the Mac platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
makedepends=('cpio')
source=("2019.3.0b8.3.0b8.pkg::https://beta.unity3d.com/download/7eb5456f98b4/MacEditorTargetInstaller/UnitySetup-Mac-Mono-Support-for-Editor-2019.3.0b8.pkg")
md5sums=("8209d8f0d8fc232ce9a976095a1254d9")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/MacStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

