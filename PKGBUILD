# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.7.5
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('a4061e04ecfedf8bb14a5c28f464571c73d475a8db2b558c6a1558b28110461aa2cd95ffb3f8edff7e42cbb4a1c1d68f2ec5d3e2b8ad2959b4edb38a05170ebc')
b2sums=('53488c4e52d96d492052452e6e4698acd86f0bf9b47b33d5e4e981c685f5cd580d6bba6088c36ed3d09f8880983a46ec9ea13d9e3db998754e5cc81559c6b6dc')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
