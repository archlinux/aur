# Maintainer: konez2k@aur
# Contributor: bruceutut@aur
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase=pyglet
pkgname=('python-pyglet')
pkgver=2.0.16
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library for Python"
arch=('any')
url="https://github.com/pyglet/pyglet"
license=('BSD')
depends=('python' 'glu' 'python-future')
makedepends=('python-setuptools')
optdepends=('ffmpeg: provides audio&video support'
    'openal: live audio')
source=("$pkgbase-$pkgver.zip::https://github.com/pyglet/pyglet/archive/refs/tags/v$pkgver.zip")
sha256sums=('0deb5263eaa2ba263817f4a72503eb0d6f33e11d3d5344c980aeb3ef249eb732')

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
}

build() {
    cd "$srcdir/$pkgbase-$pkgver"
    python3 setup.py build
}

package_python-pyglet() {
    depends=('python' 'glu' 'python-future')
    cd "$srcdir/$pkgbase-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
