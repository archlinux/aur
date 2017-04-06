# Contributor: Sherlock-Holo <sherlockya@gmail.com>

pkgname=pvim2
_pkgname=pvim
pkgver=2.0.1
pkgrel=1
pkgdesc="pvim2, pvim python version, better than pvim"
url="https://github.com/Sherlock-Holo/pvim"
arch=('any')
license=('MPL')
depends=('python-pyperclip' 'python' 'python-setuptools')
makedpends=('git')
source=("git://github.com/Sherlock-Holo/${_pkgname}.git")
md5sums=('SKIP')

pkgver(){
        cd "$srcdir/$_pkgname"
        git describe --tags | sed "s/-/./g"
}

package(){
        cd "$srcdir/$_pkgname"

        # Install
        python setup.py install --root="$pkgdir/" --optimize=1
        cd "$pkgdir/usr/bin"
        mv $pkgname.py $pkgname
}
