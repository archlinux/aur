pkgname=python-hkp4py-git
pkgver=r32.a15c321
pkgrel=1
pkgdesc="A Library for the hkp|hkps protocol on gpg|pgp keyservers."
url="https://github.com/Selfnet/hkp4py/"
license=('MIT')
arch=('any')
depends=('python-requests')
source=("git+https://github.com/Selfnet/hkp4py.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir"/hkp4py
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/hkp4py
  python3 setup.py build
}

package() {
  cd "$srcdir"/hkp4py
  python3 setup.py install --root="$pkgdir" --optimize=1
}
