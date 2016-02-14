# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=cum
pkgver=0.4
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
md5sums=('ba796e916b8970272c93a683d74f16c3'
         '1820b9b51267fb577480d1b4ce7e92ec')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 $srcdir/cumpletion.sh \
            $pkgdir/usr/share/bash-completion/completions/cum
}
