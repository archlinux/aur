# Maintainer: Payson Wallach <payson@paysonwallach.com>

pkgname=aw-core
pkgver=0.8.3
pkgrel=1
pkgdesc="Log what you do on your computer. Simple, extensible, no third parties."
arch=('i686' 'x86_64')
url="https://github.com/ActivityWatch/activitywatch"
license=('MPL2')
depends=('python>=3.5.1' 'python-iso8601' 'python-appdirs' 'python-attrs' 'python-jsonschema' 'python-peewee' 'python-json-logger' 'python-pyrsistent' 'python-strict-rfc3339' 'python-takethetime')
makedepends=('python>=3.5.1' 'python-setuptools')
source=("git+https://github.com/ActivityWatch/aw-core.git#commit=f6bcbd9")
md5sums=('SKIP')

prepare() {
    cd $pkgname
    sed -i 's/=.*//' requirements.txt
}

build() {
    cd $pkgname
    python setup.py build
}

package() {
    cd $pkgname
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
