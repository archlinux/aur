# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=b4
_randomstring=44012bad7987
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-facebook
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Facebook-Games platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
makedepends=('cpio')
source=("https://beta.unity3d.com/download/${_randomstring}/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-${_version}${_build}.pkg")
sha1sums=('17939ae2c0a9a9c0a89dde6f17ed1143d472706d')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/Facebook"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

