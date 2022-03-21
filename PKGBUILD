# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=3.8.0
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('c8a4db0d056b3b724dd043de7968acfce129af1f0688e8e8301d333c3a44b9b8a2dffc292609a453b4dddfbcfd193f6f096289573b6eb4cdd9c7c8b20b01bff7')
b2sums=('75b34a0aba10ca11309306e8b4ee5c21b5dafe4be0be3792edab71a70c559bfb168c83ef0d4c27466ebd45b97ee8876af600db9cbbad75abf03c076de3d10438')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
