_pkgbase=pip
pkgname=python38-pip
pkgver=22.3.1
pkgrel=2
pkgdesc="PIP for Python 3.8."
arch=('x86_64')
license=('MIT')
url="https://github.com/pypa/pip"
depends=('python38')
provides=($pkgname)

prepare()
{
    echo "Installing PIP for Python 3.8..."
    python3.8 -m ensurepip
}

package() {
    python3.8 -m pip install --root="$pkgdir" -U $_pkgbase
    rm -f $pkgdir/usr/bin/pip3.10
}
