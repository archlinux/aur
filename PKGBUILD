# Maintainer: Raymond Wanyoike <raymond[dot]wanyoike[at]gmail[dot]com>

_gitauthor=galliumos
_gitname=galliumos-baytrail

pkgname="${_gitname}-git"
pkgver="r30.ba48c99"
pkgrel=1
pkgdesc="GalliumOS Bay Trail customizations"
arch=("any")
url="https://github.com/${_gitauthor}/${_gitname}"
license=("GPL")
makedepends=("git")
optdepends=("galliumos-base")
provides=("galliumos-device")
conflicts=(
    "${_gitname}"
    "galliumos-sandy"
    "galliumos-haswell"
    "galliumos-broadwell"
    "galliumos-braswell"
    "galliumos-skylake"
    "galliumos-samus"
)
source=("git+https://github.com/${_gitauthor}/${_gitname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"
  install -m644 -Dt "${pkgdir}/etc/modprobe.d" etc/modprobe.d/iwlwifi-opts.conf
}
