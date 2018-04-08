# Maintainer: Arvedui <arvedui@posteo.de>
pkgname=radicale-dovecot-auth-git
pkgver=r7.06b95ff
pkgrel=2
pkgdesc="Dovecot auth for radicale"
arch=("any")
url="https://github.com/Arvedui/radicale-dovecot-auth"
license=('GPL')
groups=()
depends=('python' 'radicale')
makedepends=('git' 'python-setuptools')
options=(!emptydirs)
source=("git+https://github.com/Arvedui/radicale-dovecot-auth.git")
md5sums=("SKIP")

pkgver() {
    cd ${srcdir}/radicale-dovecot-auth
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/radicale-dovecot-auth"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
