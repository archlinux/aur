# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.7.4
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('4ecad219fcca3bd374feba7675139552b2a092eddbdc91cfd700443eb0a02cb99f05304b462e98a132bd1c05a07a135afae487744e31d36b3e9edb5753aaa1b5')
b2sums=('d6151bedbec64f9073aa308596b4da19101e12f1388bf30efce6e7de32ad25cea08974dbd43cdce7b757fb4224b0ce04dce16146441cf441e5aef9384dec8a31')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
