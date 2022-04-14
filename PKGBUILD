# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.14.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('fbc076e9dc887ec43d42a0ee6ca2615516d28dc834a8935694553f7dd1d8a0b9ff9d43b8bb5bbee0061d9d44a292ef1b0f2add6808c5269f599377303c2b26f4')
b2sums=('ae4dcd8736f4568b92bd6b635df1c6dd65dff1df3130d8a6e738849ac06cc2215cc7b6e80ee7f075a35b17adb2690afd16220b84493fcefc9b8b30ae5e2b962e')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
