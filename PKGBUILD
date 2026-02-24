pkgname=random-pics-bin
pkgver=1.1.0
pkgrel=1
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
  '22bf30653af75d1a4707c10aeac03c2fb55a32a1ea3b4040dbebe77771924169'
)

package() {
  cd "${srcdir}"
  bsdtar -xf "${_deb}"
  bsdtar -xf data.tar.gz -C "${pkgdir}"
}
