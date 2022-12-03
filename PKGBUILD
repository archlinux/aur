# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_namespace="tallero"
_pkgbase="soundscope-player"
_pkgname="${_pkgbase}"
pkgname="${_pkgbase}"
pkgver=1.1
pkgrel=1
pkgdesc="SoundScope PlayStation media player."
arch=('any')
url="https://github.com/${_namespace}/${_pkgbase}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('duckstation'
         'ffmpeg'
         'mkaudiocdrimg'
         'shntool'
         'psx-bios'
         'python-appdirs'
         'python-gobject')
makedepends=('git'
             'python-setuptools')
license=("AGPL3")
source=("${_pkgname}::git+${url}#tag=${pkgver}")
sha256sums=("SKIP")

package() {
  cd "${_pkgname}" || exit
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
