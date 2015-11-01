# Maintainer: zlsun <zlsun1995@gmail.com>

pkgname=yah3c
pkgver=0.6
pkgrel=1
pkgdesc="A program for h3c authentication in SYSU east campus."
arch=('any')
url="https://github.com/zlsun/YaH3C"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zlsun/YaH3C/archive/v${pkgver}.tar.gz"
        "yah3c@.service")
sha256sums=("9e0bc63b518ef8213d9dbbd0af5cfcf928eee5eaad5b93a630fb85a037bf48c0"
            "08f1b651b04f541651cb3a7c5c20b6a90abd98883a807f7b234e9a45c818aa74")

build ()
{
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package ()
{
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
    install -Dm644 ../yah3c@.service "${pkgdir}"/usr/lib/systemd/system/yah3c@.service
}
