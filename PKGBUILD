# Maintainer: Siam11651 <siam11651@outlook.com>

pkgname=aws-amplify-cli
_npmname='@aws-amplify/cli'
pkgver=13.0.0
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
sha512sums=('b2387ae3c0b23288a91ffddc559c1f1c90c1f04cfb9f47063a83b85fcfac42b070220313193092b59d1a4ac0ef11674f1a62fdefa2061b4160185e3bde44311f')

package() {
    install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_filename}"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
