# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=add-pacman-repository
pkgver=0.2
pkgrel=1
pkgdesc="Interactive shell script to help adding Pacman repositories."
arch=('any')
url="https://github.com/Jin-Asanami/add-pacman-repository"
_url="https://osdn.net/projects/univalentgnulinux"
license=('GPL3')
depends=('bash' 'wget')
checkdepends=('shellcheck')
conflicts=("${pkgname}")
source=("${_url}/storage/aur/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('18a5a847ae56bef8e7a3432ca7e052c4541926a5bb8ad77bade75f1d74c2dc277d40a7eb48ae7b7c20b384cddee5e963a82404efa7de0280b4424c71c2805d5a')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
