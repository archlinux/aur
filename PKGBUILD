# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.10
_build=f1
_randomstring=f2cce2a5991f
_prefix=/opt/UnityLts

pkgname=unity-editor-lts-example
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Unity Example Project based on Standard Assets."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("https://download.unity3d.com/download_unity/${_randomstring}/MacExampleProjectInstaller/Examples.pkg")
md5sums=('12f6a2570908fddece70e2d1dc831fc3')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/Examples.pkg.tmp/Payload" | gzip -dc | cpio -i
}

