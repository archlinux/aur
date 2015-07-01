pkgname=pywu
pkgver=20141003
pkgrel=1
pkgdesc="A simple python script for fetching data from Weather Underground's API"
arch=('any')
url="https://github.com/dh4/pywu"
license=('BSD')
depends=('python')

_gitroot='https://github.com/dh4/pywu.git'
_gitname='pywu'

build() {
    cd "$srcdir"
    git clone "$_gitroot"
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm755 "pywu"                       "$pkgdir/usr/bin/pywu"
    install -Dm644 "LICENSE"                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "pywu.py"                    "$pkgdir/usr/share/pywu/pywu.py"
    install -Dm644 "examples/conkyrc.example"   "$pkgdir/usr/share/pywu/examples/conkyrc.example"
}
