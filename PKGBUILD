# Contributor: Sherlock-Holo <sherlockya@gmail.com>

pkgname=pvim2
_pkgname=pvim
pkgver=2.4
pkgrel=2
pkgdesc="pvim python version, better than pvim"
url="https://github.com/Sherlock-Holo/pvim"
arch=('any')
license=('MPL')
depends=('python' 'python-requests')
optdepends=('python-pyperclip: auto copy to clip')
makedepends=('git' 'python-setuptools')
source=("git+$url")
md5sums=('SKIP')
backup=(etc/pvim2/pvim2.conf)

build(){
        cd "$srcdir/$_pkgname"
        python setup.py build
}

package(){
        cd "$srcdir/$_pkgname"
        python setup.py install --skip-build --root="$pkgdir/" --optimize=1
        #cd "$pkgdir/usr/bin"
        #mv $pkgname.py $pkgname
}
