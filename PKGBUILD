# Maintainer : Yamashita Ren
# Contributor:  Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=vapoursynth-plugin-edi_rpow2-git
pkgver=r20.1d158a3
pkgrel=1
pkgdesc="Plugins for Vapoursynth : nnedi3_rpow2, eedi3_rpow2 and eedi2_rpow2"
arch=('any')
url="http://forum.doom9.org/showthread.php?t=172652"
license=('custom:WTFPL')
depends=('vapoursynth')
optdepends=('vapoursynth-plugin-nnedi3-git: needed for nnedi3_rpow2'
            'vapoursynth-plugin-eedi2-git: needed for eedi2_rpow2')
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
  install -Dm644 "edi_rpow2.py" "${pkgdir}${_sites_packages}/edi_rpow2.py"
}
