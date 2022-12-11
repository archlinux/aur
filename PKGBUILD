# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=add-pacman-repository
pkgver=0.1
pkgrel=1
pkgdesc="Interactive shell script to help adding Pacman repositories."
arch=('any')
url="https://github.com/Jin-Asanami/add-pacman-repository"
_url="https://osdn.net/projects/univalentgnulinux"
license=('MIT')
depends=('bash' 'wget')
checkdepends=('shellcheck')
conflicts=("${pkgname}")
source=("${_url}/storage/aur/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('085188744f88ac823df209eb9332663bcca02149d7ba518630f5f43e7ab3bc0ad907398421fdc3bdd99ea7f1bce6359871a2e80f2cb3d07da8496e4cbd8f7378')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
