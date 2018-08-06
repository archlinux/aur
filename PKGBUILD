# Maintainer: Arvedui <arvedui@posteo.de>
pkgname=radicale-infcloud-git
pkgver=r20.972757b
pkgrel=2
pkgdesc="Infcloud integration for radicale"
arch=("any")
url="https://github.com/Unrud/RadicaleInfCloud"
license=('AGPL')
groups=()
depends=('python' 'radicale')
makedepends=('git')
options=(!emptydirs)
source=("git+https://github.com/Unrud/RadicaleInfCloud")
md5sums=("SKIP")

pkgver() {
    cd ${srcdir}/RadicaleInfCloud
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/RadicaleInfCloud"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
