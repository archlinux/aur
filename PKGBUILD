# Maintainer: John Luebs

pkgname=certbot-dns-namecheap-git
_pkgbase=certbot_dns_namecheap
pkgver=r4.269d2bf
pkgrel=1
pkgdesc="Namecheap API plugin for Let’s Encrypt client"
arch=('any')
license=('Apache')
depends=('certbot' 'dns-lexicon' 'python-acme' 'python-pynamecheap' 'python-setuptools')
makedepends=('git')
source=("git+https://github.com/jkl1337/certbot_dns_namecheap")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir"/${_pkgbase}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/${_pkgbase}
  python setup.py build
}

package() {
  cd "$srcdir"/${_pkgbase}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
