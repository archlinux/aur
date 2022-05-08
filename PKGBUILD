# Maintainer: Komeil Parseh <ahmdparsh129@gmail.com>

pkgname=hascal-git
_gitname=hascal
pkgdesc='Hascal is a general purpose and open source programming
language designed to build optimal, maintainable, reliable and efficient software.'
url='https://github.com/hascal/hascal'
arch=('i686' 'x86_64')
pkgrel=1
pkgver=v1.3.9.alpha.1.r44.g724b6ac
license=('MIT')
depends=('gcc' 'python' 'python-wheel' 'python-colorama' 'python-requests' )
makedepends=('git')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=("git+https://github.com/hascal/hascal.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {

    cd "$srcdir/$_gitname"

    install -d "${pkgdir}/usr/share/licenses/${_gitname}"
    install -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"

    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
