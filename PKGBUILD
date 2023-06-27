# Maintainer: Popkornium18 <mail@popkornium18.de>
pkgname=audiotag
pkgver=0.7.3
pkgrel=2
pkgdesc="Simple command line audio tagger written in python3"
arch=("any")
url="https://github.com/Popkornium18/audiotag"
license=("MIT")
depends=("python-appdirs" "python-pytaglib" "python-prompt_toolkit")
makedepends=("python-setuptools")
source=("https://github.com/Popkornium18/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("3d8576a5edd7fafb3308014f404b74b1df3fdfcb7c183fb31f45db8c4318247a")
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completion/${pkgname}.bash "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
}
