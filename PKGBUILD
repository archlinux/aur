# Maintainer: Jonathan Haylett <jonathan@haylett.dev>
_pkgbasename=i3-resurrect
pkgname=$_pkgbasename-git
pkgrel=3
pkgver=1.0.2
pkgdesc="A simple but flexible solution to saving and restoring i3 workspace layouts"
arch=('any')
url="http://github.com/JonnyHaystack/i3-resurrect"
license=('GPL')
depends=('python' 'python-setuptools' 'i3-wm' 'perl-anyevent-i3' 'wmctrl')
source=(git+https://github.com/JonnyHaystack/i3-resurrect)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbasename"
    git tag -l --sort=-v:refname | head -n 1
}

build() {
    cd "$srcdir/$_pkgbasename"
    
    python setup.py build
}


package() {
    cd "${srcdir}/${_pkgbasename}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
