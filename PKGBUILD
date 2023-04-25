# Contributor: Emilio Reggi <nag@mailbox.org>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postsack-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Visually cluster your emails by sender, domain, and more to identify waste"
arch=('x86_64')
url="https://github.com/terhechte/postsack"
license=('MIT')
provides=()
depends=('hicolor-icon-theme' 'gcc-libs' 'glibc' 'libxcb')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_1.0.0_amd64.deb"
   "LICENSE::${url}/raw/main/LICENSE.md")
sha256sums=('c35704da2d6ae3bb6f99b84b37abf40bfa7ec5e4de7e404e62ef5774bfd7d984'
            '27a8dc9b024005e4298e225801161df5db47f2ad5f82b03560a3584370c35d61')

package() {
   bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
   install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}