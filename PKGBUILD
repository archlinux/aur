# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=cum
pkgver=0.5
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
sha256sums=('0538fa2dc30b36ba638cff3594f5b4155728a771b35c3a36087cb08b876f8ff6'
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
