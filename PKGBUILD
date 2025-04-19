# Maintainer: Siam11651 <siam11651@outlook.com>

pkgname=aws-amplify-cli
_npmname='@aws-amplify/cli'
pkgver=13.0.1
pkgrel=1
pkgdesc='The AWS Amplify CLI is a toolchain for simplifying serverless web and mobile development.'
arch=('any')
url='https://docs.amplify.aws/cli/'
license=('Apache License 2.0')
conflicts=()
depends=('nodejs')
makedepends=('npm')
_filename="cli-${pkgver}.tgz"
source=("https://registry.npmjs.org/${_npmname}/-/${_filename}")
sha512sums=('b044de2e9c0fabeabd7abee5527fab5f3a4526f28c2669750c99479fab2171edb98d9ca9c3905356342132d888be6623f569d0a77876592f3834af517c956945')

package() {
    install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_filename}"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
