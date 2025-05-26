# Maintainer: Vlad Vasiliu <vladvasiliun@yahoo.fr>
pkgname=git-remote-codecommit
pkgver=1.17
pkgrel=5
pkgdesc='Git extension for interacting with AWS CodeCommit repositories using federated access.'
arch=('any')
url='https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-git-remote-codecommit.html'
license=('Apache')
provides=()
makedepends=()
depends=('python-botocore' 'python' 'python-setuptools')
source=("${pkgname}-1.17.tar.gz::https://github.com/aws/git-remote-codecommit/archive/1.17.tar.gz")
sha256sums=('e497a0660ea318c2b3d7330a316fea637ff6d865039f2d2f933379b99b97b757')

build() {
    cd ${srcdir}/${pkgname}-1.17
    python setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-1.17
    python setup.py install --root=${pkgdir}

    install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

