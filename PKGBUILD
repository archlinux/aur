# Maintainer: Donnie Bishop <donnie.a.bishop@gmail.com>

pkgname=legofy-git
pkgver=r184.0154ef5
pkgrel=1
pkgdesc="Make images look as if they are made out of 1x1 LEGO blocks"
arch=('any')
url="https://github.com/JuanPotato/Legofy"
license=('MIT')
depends=('python' 'python-pillow' 'python-click')
makedepends=('git' 'python') 
provides=("legofy")
conflicts=("legofy")
options=(!emptydirs)
source=("git://github.com/JuanPotato/Legofy")
md5sums=('SKIP')

_gitname='Legofy'

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
