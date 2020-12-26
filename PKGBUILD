# Maintainer: Vlad Vasiliu <vladvasiliun@yahoo.fr>
pkgname=git-remote-codecommit
pkgver=1.15.1
pkgrel=1
pkgdesc='Git extension for interacting with AWS CodeCommit repositories using federated access.'
arch=('any')
url='https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-git-remote-codecommit.html'
license=('Apache')
provides=()
makedepends=()
depends=('aws-cli')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aws/git-remote-codecommit/archive/${pkgver}.tar.gz")
sha256sums=('23bcc0715c72217f8dcd5841aecce537c360138016baa6b1ed9a2873af546e0b')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py install --root=${pkgdir}

    install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}



