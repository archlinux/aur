# Maintainer: Hayate Nakamura <is01.njb@gmail.com>
pkgname=unifetch
pkgver=1.0.2
pkgrel=1
pkgdesc="An unofficial successor of neofetch."
arch=('any')
url="https://osdn.net/projects/univalentgnulinux/"
license=('MIT')
depends=('bash')
makedepends=('git')
checkdepends=('shellcheck')
conflicts=("${pkgname}")
source=("${url}/downloads/77899/${pkgname}-${pkgver}.tar.gz")
sha512sums=('496266548792658a08d9b3036636f2df4d42f6bf2e0845ec1fa615719ee69aab94e2a5aea3f8d644dc3953bfae2bc32b03c98297888215cf203295768be56f11')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
