# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=optimizevideo-git
_pkgname=optimizevideo
pkgver=r15.1dd2dec
pkgrel=1
pkgdesc="Substitutes a video for its smallest size version which does not have perceivable quality loss"
arch=('any')
url='https://gitlab.com/es20490446e/optimizeVideo'
license=('AGPL')
provides=('optimizevideo' 'args')
depends=('libvpx'
         'opus'
         'ffmpeg'
         'solve')
makedepends=('git')
source=("optimizevideo::git+${url}"
        "args::git+https://gitlab.com/es20490446e/args")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  cp -avR root/usr "${pkgdir}/"
  cd "${srcdir}/args"
  cp -avR root/usr "${pkgdir}/"
}