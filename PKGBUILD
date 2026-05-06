# Maintainer: Riderius <riderius.help@gmail.com>

pkgname='git-fame'
pkgver='3.1.2'
pkgrel=1
pkgdesc='Pretty-print git repository collaborators sorted by contributions'
arch=('any')
url="https://github.com/casperdcl/$pkgname"
license=('MPL-2.0')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
depends=('python-argopt' 'python-tqdm' 'python-tabulate')
optdepends=('python-yaml')
provides=('git-fame')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('d52a4d0925a076bf009d9ebc77cf84d16b49e2c429f6a6165ddae9cfd8a1150d')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # rm "$pkgdir/usr/lib/python3.12/site-packages/gitfame/git-fame.1"
    # install -Dm644 "${srcdir}/git-fame/gitfame/git-fame.1" "${pkgdir}/usr/share/man/man1/git-fame.1"
}
