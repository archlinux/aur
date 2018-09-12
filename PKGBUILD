# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=b1
_randomstring=3f0ac31c6d6f
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-webgl
pkgver=${_version}${_build}+${_buildtag}
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta'
         'ffmpeg'
         'gzip')
source=("https://beta.unity3d.com/download/${_randomstring}/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-${_version}${_build}.tar.xz")
sha1sums=('ed5367dfd211c059d2feb8a4fd8d5ed55d8059f1')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

