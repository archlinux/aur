# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=mvmulti
pkgname=vapoursynth-plugin-${_plug}
pkgver=r9
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/IFeelBloated/vapoursynth-mvtools-sf/tree/r9"
license=('GPL')
depends=('vapoursynth-plugin-mvtools_sf-git')
source=('https://raw.githubusercontent.com/IFeelBloated/vapoursynth-mvtools-sf/r9/src/mvmulti.py')
sha256sums=('97ead4d5dee3f9a8a3fca31cadc1978f5cacf442c78bf198c84ab5de1e277dc2')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

package(){
  install -Dm644 "${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
