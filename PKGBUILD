# Maintainer:   Maximilian Weiss         <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  The Vertcoin Developers  <$(echo "Y29udGFjdEB2ZXJ0Y29pbi5vcmcK" | base64 -d)>

pkgname=python-vtc_scrypt
pkgver=1.1.5
pkgrel=3
pkgdesc='Bindings for scrypt-n proof of work used by Vertcoin'

arch=('any')
url='https://github.com/vertcoin-project/vtc-scrypt'
license=('MIT')

makedepends=('git')
depends=('python-setuptools' 'scrypt')

provides=('python-vtc_scrypt')
conflicts=('python-vtc_scrypt')

source=('git://github.com/vertcoin-project/vtc-scrypt.git')

md5sums=('SKIP')

package() {
    cd "$srcdir/vtc-scrypt/"
    git checkout 9b297869de41d385e571d86a70e98254cd83041b >/dev/null 2>&1
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}

