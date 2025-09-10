# Maintainer J. Simplício <simplyceo.developer@gmail.com)

pkgname=runit-service
pkgdesc="A custom tool to manage runit services."
pkgver=a0.2.2
pkgidentifier="${pkgname}-${pkgver}"
pkgrel=1
replaces=('runit-service')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://gitlab.com/SimplyCEO/runit-service'
license=('GPL-2.0-or-later')
depends=('runit')
makedepends=('make')
optdepends=('gcc' 'clang' 'tcc')
source=("${pkgidentifier}.tar.gz::https://gitlab.com/SimplyCEO/runit-service/-/archive/${pkgver}/${pkgidentifier}.tar.gz")
sha256sums=('41a5481f040f34380c1cdd2ca72b1d3fa75572f77340573a2f1689051eb04412')

build()
{
  cd "${srcdir}/${pkgidentifier}"

  make
}

package()
{
  cd "${srcdir}/${pkgidentifier}"

  install -Dm755 bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 service/runit-journal/run "${pkgdir}/etc/runit/sv/runit-journal/run"

  make clean
}

