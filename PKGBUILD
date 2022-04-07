# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.12.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('08aa491a7298c5fc42630d08a23a2275f662b9e3a5d1b85bcd37117070d50cf24b8b70d8310fa8e84c16b45ee6dfa364c3a1574f7e96a2dee99a58c7a1762b41')
b2sums=('1cc00f1cb6a8128d15d57d0e3eb5ebc1d04a11036a92385e43bfe8182cae1a2b210117d81f63e51082ee899b02aebedcdd9fc5be32b47c779ab4b3024ec9ff54')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
