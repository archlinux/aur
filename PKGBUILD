# Maintainer: xuhcc <xuhcc@cryptolab.net>

origname=lexid
pkgname=python-lexid
pkgver=2021.1006
_ref='1334ace84f67f59d93a96b9bf0a4953fb7a15da6'
pkgrel=1
pkgdesc='A Micro Library to Increment Lexical Ids'
arch=(any)
url="https://github.com/mbarkhau/$origname"
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer")
source=("${url}/archive/${_ref}.zip")

build() {
    cd "$origname-$_ref"
    python -m build --wheel --no-isolation
}

package() {
    cd "$origname-$_ref"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('a80eeec081525a431b24c348253a2cb8ab6a67bd4d1c2b70404e5b7dc1361371')
