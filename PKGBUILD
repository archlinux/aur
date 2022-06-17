# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.19.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('5ea6d9f948712e39f09f338432479c25debc0b73fd83d7d01b084792e41e9678b78488e62e5ce4541c7ac25c6b20146001713d440965c19bc2b22da367d8765b')
b2sums=('886566e67661c432e8c3de2949838dd5678ae12961b1a9a44d016431d905faaf2b6c45ec2e1595bfecef9e20732a4760c95f2ce557949d24964586c4447122bf')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
