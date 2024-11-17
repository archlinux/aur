# Maintainer: Jochem Broekhoff <(lastname) dot (firstname) @ gmail.com>
_pkgname=python_speech_features
pkgname=python-speech-features
pkgver=0.6.1
pkgrel=3
pkgdesc="Python Speech Feature extraction"
arch=('any')
license=('MIT')
url="https://github.com/jameslyons/${_pkgname}"

depends=("python-scipy"
         "python-numpy")
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/jameslyons/${_pkgname}/archive/${pkgver}.zip")
sha256sums=("30ed2034fb26bc83b2b4a527a4fc45323c5a7674be0ac304f22559acfdb84e37")

build() {
    cd $srcdir/$_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
