# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-shlib'
_pkgname=${pkgname#python-}
pkgver=1.5
pkgrel=1
pkgdesc="A light-weight library to do shell-script like things with Python"
arch=('any')
makedepends=('python-setuptools' 'python-pip')
optdepends=('python-braceexpand' 'python-inform')
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')

source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
        "$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz.asc"
)
validpgpkeys=('4A47DE443CEE6D70A892347A9B8FFF1D3E1C0A50')

b2sums=('3a9bdd918c00d8cae386fd8af01eade95f8fb171ca7db6036b9c3eb1cbba3e794623cc7d108d69e8fdedcd33220f17090929bb6095b9c96baa09b0f6af857433'
        'SKIP')

build() {
	cd $_pkgname-$pkgver
	python setup.py build
}

package() {
	cd $_pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
