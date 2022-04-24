# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.15.2
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('514fa8e19a653815593dd2677726e341f482f9f70836df2e0203f93b1f84ca360a003f5da3771e1f3e09c23a4b2433cf5ae0cf80e3a4b6461abbe888f58ea11e')
b2sums=('1023291d7f795e291e9132a7bf7f9ab5fe5f00e972d2da42ef3127c7a0795bcd687e38b493672c18e4c0e325ead9488855d05149549ef5075f020f23d3ddacd7')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
