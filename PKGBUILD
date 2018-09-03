# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.10
_build=f1
_randomstring=f2cce2a5991f
_prefix=/opt/UnityLts

pkgname=unity-editor-lts-standardassets
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Unity Standard Assets for easily getting started building projects in Unity."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("https://download.unity3d.com/download_unity/${_randomstring}/MacStandardAssetsInstaller/StandardAssets.pkg")
md5sums=('6116be0aa8efaaab286a0567396fe3bd')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Standard Assets"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/StandardAssets.pkg.tmp/Payload" | gzip -dc | cpio -i
}

