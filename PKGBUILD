# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: warddr <aur@warddr.eu>
# Submitter: Frank Smit <frank/61924/nl>

pkgbase=python-speaklater
pkgname=('python2-speaklater' 'python-speaklater')
pkgver=1.3
pkgrel=4
pkgdesc="Implements a lazy string for python useful for use with gettext."
arch=('any')
url="https://pypi.python.org/pypi/speaklater"
license=("BSD")
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.io/packages/source/s/speaklater/speaklater-${pkgver}.tar.gz")
md5sums=('e8d5dbe36e53d5a35cff227e795e8bbf')

prepare() {
    cp -R speaklater-$pkgver python2-speaklater-$pkgver
}

package_python2-speaklater() {
depends=('python2')

    cd speaklater-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr

    install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-speaklater() {
depends=('python')

    cd speaklater-$pkgver
    python setup.py install --root="$pkgdir" --prefix=/usr

    install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

