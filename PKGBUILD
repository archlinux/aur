# Maintainer: Jonathan Haylett <jonathan@haylett.dev>
_pkgbasename=i3-resurrect
pkgname=$_pkgbasename
pkgrel=1
pkgver=1.4.1
pkgdesc='A simple but flexible solution to saving and restoring i3 workspace layouts'
arch=('any')
url='http://github.com/JonnyHaystack/i3-resurrect'
license=('GPL')
depends=('python' 'python-psutil' 'python-i3ipc' 'python-click' 'python-natsort' 
         'python-enum-compat' 'xorg-xprop' 'xdotool')
makedepends=('python-setuptools')
optdepends=('i3-wm')
provides=('i3-resurrect')
conflicts=('i3-resurrect-git')
source=("https://github.com/JonnyHaystack/i3-resurrect/archive/$pkgver.tar.gz")
md5sums=('53bcc2fbb44798b3298c2bbc589f06c3')

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
