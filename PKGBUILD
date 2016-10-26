# Maintainer: Dmitriy Bogdanov <di72nn at gmail dot com>
# Contributor: Robin Hahling <robin.hahling@gw-computing.net>
# Contributor: Kevin Gillieron <kevin.gillieron@gw-computing.net>
pkgname=shaarli
_pkgname=shaarli
_Pkgname=Shaarli
pkgver=0.7.0
pkgrel=1
pkgdesc='The personal, minimalist, super-fast, no-database delicious clone - community repo'
arch=('any')
url="https://github.com/shaarli/Shaarli"
license=('ZLIB')
depends=('php')
source=("https://github.com/shaarli/Shaarli/archive/v${pkgver}.tar.gz")
sha256sums=('5f30c0ded283578011e637f5f7b46fd56d9d3cdaf3f42fd6a4f4dfe44074b33c')

package() {
  cd "${pkgdir}"
  mkdir -p "usr/share/webapps" "usr/share/licenses/${_pkgname}" "etc/webapps/${_pkgname}"

  mv "${srcdir}/${_Pkgname}-$pkgver/COPYING" "usr/share/licenses/${_pkgname}/"
  mv "${srcdir}/${_Pkgname}-$pkgver" "usr/share/webapps/${_pkgname}"

  chown -R root:http "${pkgdir}/usr/share/webapps/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
