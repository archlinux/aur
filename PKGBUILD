# Maintainer: Popkornium18 <mail@popkornium18.de>
pkgname=audiotag
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple command line audio tagger written in python3"
arch=('any')
url="https://gitlab.com/Popkornium18/audiotag"
license=('MIT')
depends=('python' 'python-setuptools' 'python-pytaglib' 'python-docopt')
source=("https://gitlab.com/Popkornium18/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('b45129afad2cc059dc9f6c27edf2b18f9130d1e43d0f5ef037521a04d854db43')


package() {
    cd ${srcdir}/${pkgname}-v${pkgver}
    /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completion/${pkgname}.bash "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
}
