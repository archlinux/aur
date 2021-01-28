# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=python-bmp2hex-git
_pkgname=${pkgname%-git}
_script=${_pkgname#python-}
pkgver=2.3.4.ac6c665
pkgrel=2
pkgdesc="Python utility to convert 1-, 4-, 8- and 16-bit bitmap files to hex. Used to embed graphics in Arduino/C code, primarily for display."
arch=('any')
url="https://github.com/robertgallup/python-bmp2hex"
license=('MIT')
depends=('python')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/robertgallup/python-bmp2hex")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  printf "%s.%s" "$(python -c "import ${_script};print(${_script}.DEFAULTS().VERSION)")" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 ${_pkgname}/${_script}.py ${pkgdir}/usr/bin/${_script}
  install -Dm644 ${_pkgname}/license.txt -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
# vim: set sw=2 ts=2 et:
