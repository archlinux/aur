# Maintainer: Jason Nader <jason (dot) nader (at) protonmail (dot) com>
pkgname=('lgwebosremote-git')
pkgver=r135.2de8913
pkgrel=1
pkgdesc="Command line webOS remote for LGTVs"
arch=('x86_64')
url="https://github.com/klattimer/LGWebOSRemote"
license=('MIT')
depends=('python-wakeonlan' 'python-ws4py' 'python-requests' 'python-getmac')
makedepends=('git' 'python-setuptools')
source=("${pkgname%-*}::git+https://github.com/klattimer/LGWebOSRemote.git")
provides=("lgtv")
conflicts=("lgtv")

md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-*}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
