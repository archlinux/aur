# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=maskdetail
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r8.2af7b11
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171546'
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/MonoS/VS-MaskDetail.git")
sha1sums=('SKIP')

_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  install -Dm644 "${_plug}/MaskDetail.py" "${pkgdir}${_sites_packages}/maskdetail.py"
}
