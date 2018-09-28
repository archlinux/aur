# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=cum
pkgver=0.9.1
pkgrel=1
pkgdesc="Comic Updater, Mangafied"
arch=('any')
url="https://github.com/Hamuko/cum"
license=('Apache')
depends=('python-click' 'python' 'python-requests' 'python-sqlalchemy' 
         'python-beautifulsoup4' 'python-natsort' 'python-alembic')
source=("https://github.com/Hamuko/cum/archive/v${pkgver}.tar.gz"
        "cumpletion.sh")
options=(!emptydirs)
sha256sums=('ace48874cef90bd7d81d66b78338f1b91cbb7a39bd287e069d99fee7d35b52c4'
            'b24dcf05451e83932d741e5088b4526d1ce9f45e97698c37d74f2a2c54618651')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 $srcdir/cumpletion.sh \
            $pkgdir/usr/share/bash-completion/completions/cum
}
