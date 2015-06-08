# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=resamplehq
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r4
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url="http://forum.doom9.org/showpost.php?p=1715171&postcount=6"
license=('GPL')
depends=('vapoursynth' 'vapoursynth-plugin-dither-git' 'vapoursynth-plugin-fmtconv')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://gist.github.com/64642122e359c37543fe.git")
sha1sums=('SKIP')
_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  printf "r%s" "$(git rev-list --count HEAD)"
}

package() {
  install -Dm644 "${_plug}/${_plug}.py" "${pkgdir}${_sites_packages}/${_plug}.py"
}
