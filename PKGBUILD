# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=serverless
pkgver=2.66.1
pkgrel=1
pkgdesc='Serverless Framework - Build web, mobile and IoT applications with serverless architectures'
url='https://github.com/serverless/serverless'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('4b07f96878af49f5347cabaf578158d1698c341655c7b7152b715cc562d7d6516ecd443ee43fdba6e9c75b8966838b4a986b63067434a10fb8376307137c0fae')
b2sums=('4397ba47a4e3e6b79cab04c5c6b5468e49a6508a644a4cfa38beeb3aa7c92f10c56f86a1272a98db50020060ada3da93f4e268d03d57264b7b4c40daca2be022')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim: ts=2 sw=2 et:
