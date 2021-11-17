# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.66.2
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('56910aedc6925d3d11a7e4baba4a5eb3f22d06a31256df8783c635ea2dc557ae52c220da5d68af7965d42ba90c8472ee01e87f565d67647ae72ff2a2a1d5ae75')
b2sums=('59ce1d37e5a95a0d48549ed2b858d9cd8c87d6d4883a05fe172d90a96466bc9263c0382f43bd97d7ec31bcd678f3eea43bfc5f2a883f1941bd5ab7aff34145fd')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
