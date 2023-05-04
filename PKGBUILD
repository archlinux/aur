# Maintainer: Luke Arms <luke@arms.to>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>
# Contributor: Guan Qing <neokuno@gmail.com>
# Contributor: Liudas <liudas@akmc.lt>
# Contributor: Tom Tryfonidis <tomtryf [at] gmail [dot] com>

pkgname=key-mon
pkgver=1.20
pkgrel=2
url="https://github.com/scottkirkwood/key-mon"
pkgdesc="A screencast utility that displays your keyboard and mouse status"
arch=('any')
license=('Apache')
depends=('gtk3' 'python' 'python-cairo' 'python-gobject' 'python-xlib')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('8f8ef0a1cad92d6bd6e3e954b7b6989e69153ade83a41362561eae2e546df6dc1e4165c4fbc47357d489ea8df7f24a1a52d2f72afa17482f04f509c0b8e4a4fd')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
