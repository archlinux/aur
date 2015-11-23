# Submitter : Dobroslaw Kijowski <dobo90 at gmail dot com>
# Maintainer: Dmitrij Podabed <dmitrij at podabed dot org>
# Maintainer: Dmitrij Podabed <dmitrij at podabed dot org>

pkgname=connman-ncurses
_pkgname=connman-json-client
pkgver=1.0
pkgrel=2
pkgdesc='Simple ncurses UI for ConnMan'
arch=(i686 x86_64)
url='https://github.com/eurogiciel-oss/connman-json-client'
license=(GPL2)
depends=(json-c connman)
conflicts=(connman-ncurses-git)
source=("https://github.com/eurogiciel-oss/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=(26f23eaa1828e2d7a45fce94e1a06203)

build()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"

  autoreconf -i
  # it doesn't compile without --disable-optimization flag
  ./configure --prefix='/usr' --disable-optimization
  make
}

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -D -m 755 connman_ncurses "${pkgdir}/usr/bin/${pkgname}"
}
