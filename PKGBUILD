# Maintainer :Popolon < Popolon @L popolon.org >

pkgname=luajit-glfw
pkgver=3.4.0
pkgrel=1
pkgdesc='GLFW bindings for LuaJIT'
arch=('any')
url="https://github.com/Playermet/${pkgname}"
license=('custom:ZLIB')
depends=('luajit' 'glfw')
makedepends=('git')
source=("https://github.com/Playermet/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(a7fdff4df32f323299a2ccfd50d52fc14141b5fe7e3febd7d24f5a11d4c2c6ab)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  luajitver=`luajit -v | awk '{print $2}'| cut -d . -f 1,2`
  mkdir -p ${pkgdir}/usr/share/luajit-${luajitver}/
  install -Dm 644 glfw.lua ${pkgdir}/usr/share/luajit-${luajitver}/
}
