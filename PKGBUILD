# Maintainer: Carl George < arch at cgtx dot us >

_name="japronto"
_module="$_name"

pkgname="python-$_module"
pkgver=0.1.1
pkgrel=1
pkgdesc="A micro-framework bundled with server based on uvloop and picohttpparser"
arch=("i686" "x86_64")
url="https://github.com/squeaky-pl/japronto"
license=("MIT")
makedepends=("python-setuptools")
source=("https://github.com/squeaky-pl/japronto/archive/v$pkgver.tar.gz")
sha256sums=('53ca62beb928f83d464fb3a7fdc10131415960ace1e60a7578eef4d148f91d45')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    depends=("python-uvloop>=0.7.2")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
