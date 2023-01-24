# Maintainer: goetzc
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=python-spotipy
pkgver=2.22.1
pkgrel=1
pkgdesc='A light weight Python library for the Spotify Web API'
arch=('any')
url='https://github.com/spotipy-dev/spotipy'
license=('MIT')
depends=('python-requests' 'python-six' 'python-redis')
makedepends=('python-setuptools')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/spotipy-dev/spotipy/archive/$pkgver.tar.gz")
sha512sums=('d8c5871dd606e3335656fb55fa042d8c91c72a4c7d62a584bd407a7546184996694c67d499f908fc7049e406c548269286de6cba17064f0385adba3661b34c3b')

build() {
    cd spotipy-$pkgver
    python setup.py build
}

package() {
    cd spotipy-$pkgver
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
