# Maintainer : Yamashita Ren
# Contributor:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=nnedi3_rpow2
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1.7871410
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=166582"
license=('GPL')
depends=('vapoursynth' 'vapoursynth-plugin-nnedi3-git')
makedepends=('git')
source=("$pkgname"::"git://gist.github.com/020c497524e794779d9c.git")
sha1sums=('SKIP')
_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm644 "${_plug}.py" "${pkgdir}${_sites_packages}/${_plug}.py"
}
