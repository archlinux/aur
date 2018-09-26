# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.11
_build=f1
_randomstring=8c6b8ef6d111
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
md5sums=('a186885e55f2e875b26f11d2062790c6')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/Examples.pkg.tmp/Payload" | gzip -dc | cpio -i
}

