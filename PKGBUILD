# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=add-pacman-repository
pkgver=0.2.1
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
sha512sums=('1da15437d04424d830bd047a338e0cead3534e03c14f840046a8b6cdaaef7109afedf887c9b946bfb2f428516312882f328abcd3da009d5b6ec086e1eefede38')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
