# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=b2
_randomstring=21e0e8a5466d
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-facebook
pkgver=${_version}${_build}
pkgrel=2
pkgdesc="Allows building your Unity projects for the Facebook-Games platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
makedepends=('cpio')
source=("https://beta.unity3d.com/download/${_randomstring}/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-${_version}${_build}.pkg")
sha1sums=('a12561269182d64707d7e35bf77760447fcfde14')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/Facebook"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

