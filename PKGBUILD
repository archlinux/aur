pkgname=python-multivault-git
pkgver=r93.26c1dc7
pkgrel=1
pkgdesc="A CLI to encrypt and decrypt content for ansible"
url="https://github.com/Selfnet/multivault/"
license=('MIT')
arch=('any')
depends=('python-gpgme' 'python-yaml' 'python-ldap3' 'python-paramiko' 'python-voluptuous' 'python-hkp4py-git')
source=("git+https://github.com/Selfnet/multivault.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir"/multivault
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/multivault
  python3 setup.py build
}


package() {
  cd "$srcdir"/multivault
  python3 setup.py install --root="$pkgdir" --optimize=1
}
