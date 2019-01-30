# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-mac
pkgver=2019.1.0b1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Mac platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
makedepends=('cpio')
source=("2019.1.0b1.1.0b1.pkg::https://beta.unity3d.com/download/83b3ba1f99df/MacEditorTargetInstaller/UnitySetup-Mac-Mono-Support-for-Editor-2019.1.0b1.pkg")
md5sums=("23bf30fabf80e3a00e2d99a1d9b275f1")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/MacStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

