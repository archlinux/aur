# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.50.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('f67d807e1d2f108ea0b8302e7b7166d57bb507b8bbcd547e2c2dfb007521866031611bb4847e9aa3511176b8148476f3995d8fe36c8b443d28b01e1a96ba7c83')
b2sums=('d0dff2a45d30287cef65d76494e15d33b22bcc7fcf905c3e151355df638bb8987d6508e6dd01105ef9b932a4e145c1a8ab3e9a27e77154c77b5ba8722a0a8532')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
