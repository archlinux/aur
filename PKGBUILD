# Maintainer: konez2k@aur
# Contributor: bruceutut@aur
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase=pyglet
pkgname=('python-pyglet')
pkgver=2.0.9
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library for Python"
arch=('any')
url="https://github.com/pyglet/pyglet"
license=('BSD')
depends=('python' 'glu' 'python-future')
makedepends=('python-setuptools')
optdepends=('ffmpeg: provides audio&video support'
    'openal: live audio')
source=("https://github.com/pyglet/pyglet/archive/refs/tags/v$pkgver.zip")
sha256sums=('74ac223a0d67294541dc5314e3a14b982dc056664989a1e21eca98985329ef56')

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
