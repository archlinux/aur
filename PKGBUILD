# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_namespace="tallero"
pkgbase="mkaudiocdrimg"
_pkgname="${pkgbase}"
pkgname="${pkgbase}"
pkgver=1.2.1
pkgrel=1
pkgdesc="Make an audio CD-R image from media files."
arch=('any')
url="https://gitlab.com/${_namespace}/${pkgbase}"
depends=('ffmpeg'
         'shntool'
         'python-appdirs')
makedepends=('git'
             'python-setuptools')
license=("AGPL3")
source=("${_pkgname}::git+${url}#tag=${pkgver}")
sha256sums=("SKIP")


package() {
  cd "${_pkgname}" || exit
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
