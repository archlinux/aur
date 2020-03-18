# Maintainer: Jonathan Haylett <jonathan@haylett.dev>
_pkgbasename=i3-resurrect
pkgname=$_pkgbasename
pkgrel=2
pkgver=1.4.3
pkgdesc='A simple but flexible solution to saving and restoring i3 workspace layouts'
arch=('any')
url='http://github.com/JonnyHaystack/i3-resurrect'
license=('GPL')
depends=('python' 'python-psutil' 'i3ipc-python-git' 'python-click'
         'python-natsort' 'xorg-xprop' 'xdotool')
makedepends=('python-setuptools')
optdepends=('i3-wm')
provides=('i3-resurrect')
conflicts=('i3-resurrect-git')
source=("https://github.com/JonnyHaystack/i3-resurrect/archive/$pkgver.tar.gz")
md5sums=('22a77c7d161d19942d2e561f87e7ab54')

build() {
    cd "$srcdir/$_pkgbasename-$pkgver"
    python setup.py bdist
}

package() {
    _pkg=$(ls "$srcdir/$_pkgbasename-$pkgver/dist/")
    tar -xC "$pkgdir/" -f "$srcdir/$_pkgbasename-$pkgver/dist/$_pkg"
    mkdir -p "$pkgdir/usr/bin"
    _python=$(ls "$pkgdir/usr/lib/")
}
