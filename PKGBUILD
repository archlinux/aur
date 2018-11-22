# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.15
_build=f1
_randomstring=5d485b4897a7
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
md5sums=('beb8b3f2473994c1068dca45d75c5a31')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Standard Assets"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/StandardAssets.pkg.tmp/Payload" | gzip -dc | cpio -i
}

