# Maintainer: sukanka <su975853527[AT]gmail.com>

pkgname=certbot-dns-dnspod-git
_pkgname=${pkgname%-git}
pkgver=r14.b8ce943
pkgrel=1
pkgdesc="A certbot dns plugin to obtain certificates using dnspod."
arch=("any")
url="https://github.com/tengattack/certbot-dns-dnspod"
license=("Apache")
depends=('python' 'python-acme' 'certbot' 'python-zope-interface' 'python-mock' 'dns-lexicon')
provides=("${_pkgname}")
makedepends=("git" "python-setuptools")
source=("git+${url}.git")
sha512sums=('SKIP')
pkgver(){
    cd $srcdir/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
    cd $srcdir/${_pkgname}
    python setup.py build

}


package(){
    cd $srcdir/${_pkgname}
    python setup.py install --root="$pkgdir" --optimize=1
}
