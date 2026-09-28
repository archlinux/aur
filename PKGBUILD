# Maintainer: Uffe Jakobsen < uffe _at_ uffe _dot_ org >
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

_pkgname="ampy"
pkgname="python-ampy-git"
pkgver=1.0.7.r44.g3633a14
pkgrel=1
#pkgdesc="ESP8266 FS management tool provided by Adafruit"
pkgdesc="Utility to interact with a CircuitPython or MicroPython board over a serial connection - provided by Adafruit"
#url="https://github.com/adafruit/ampy"
url="https://github.com/scientifichackers/ampy"
arch=("any")
license=("MIT")
depends=("python" "python-click" "python-pyserial")
makedepends=("python-setuptools")
provides=('python-ampy' 'ampy')
#source=("${pkgname}::git+https://github.com/adafruit/ampy")
source=("${_pkgname}::git+https://github.com/scientifichackers/ampy.git")
sha512sums=("SKIP")


pkgver()
{
  #cd "${srcdir}/${pkg_name_ver}"
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags 2>/dev/null | sed -n -e 's/\(^[^0-9]*\)\([^-]*.\)/\2r/g; s/-/./gp' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
  #cd "${srcdir}/${pkg_name_ver}"
  cd "${srcdir}/${_pkgname}"
}

build()
{
  #cd "${srcdir}/${pkg_name_ver}"
  cd "${srcdir}/${_pkgname}"
  #make all
}

package()
{
  #cd "${srcdir}/${pkg_name_ver}"
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}/"
  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim:set ts=2 sw=2 et:
