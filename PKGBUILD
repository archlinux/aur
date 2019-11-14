# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='wgtools'
pkgname="python-${_pkgbase}-git"
pkgver=r11.f986439
pkgrel=2
pkgdesc='Python bindings for wireguard-tools'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'wireguard-tools')
makedepends=('git')
provides=("python-${_pkgbase}")
source=("${_pkgbase}::git+${url}.git")
md5sums=('SKIP')


pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
