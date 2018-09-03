# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.10
_build=f1
_randomstring=f2cce2a5991f
_prefix=/opt/UnityLts

pkgname=unity-editor-lts-facebook
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Facebook-Games platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("https://download.unity3d.com/download_unity/${_randomstring}/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-${_version}${_build}.pkg")
md5sums=('b8441690cbef39ac91ee3353879c3244')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/Facebook"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

