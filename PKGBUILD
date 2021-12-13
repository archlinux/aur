# Maintainer: Vlad Vasiliu <vladvasiliun@yahoo.fr>
pkgname=git-remote-codecommit
pkgver=1.16.0
pkgrel=2
pkgdesc='Git extension for interacting with AWS CodeCommit repositories using federated access.'
arch=('any')
url='https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-git-remote-codecommit.html'
license=('Apache')
provides=()
makedepends=()
depends=('aws-cli' 'python-botocore' 'python')
source=("${pkgname}-1.16.tar.gz::https://github.com/aws/git-remote-codecommit/archive/1.16.tar.gz")
sha256sums=('ae8847c67bef283eb3a09ab0d920295cb33bc8544b1e6838dacd5c5619ddf1ba')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py install --root=${pkgdir}

    install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

