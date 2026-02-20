pkgname=random-pics-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="Fast desktop local image viewer for gesture drawing practice"
arch=('x86_64')
url="https://github.com/YukiYuziriha/random-pics"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1')
provides=('random-pics')
conflicts=('random-pics')
_deb="random-pics_${pkgver}_amd64.deb"
source=(
  "https://github.com/YukiYuziriha/random-pics/releases/download/v${pkgver}/${_deb}"
)
sha256sums=(
  'c983d59019586f6e42a278e4127c30ffd990c31af8a453a0331aa631b0bef0c0'
)

package() {
  cd "${srcdir}"
  bsdtar -xf "${_deb}"
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
