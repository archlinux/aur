# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.56.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('fe7983d5a2defab5d9a539a7c731e8802b79a86181ac4fb071eecb70b575c8d9def9aca6c8270bf2f70b8f621bdae9135f0796a6bf0cc4081d5d5b5bc18e0418')
b2sums=('db98726a10f998d7248d937ac29691164e3e0e56f2622439e5b2da3439c938c49f062966954796c6d64a1389069b86ff35f152bc9d3c9c0b9938af864c75255c')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
