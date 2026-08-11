# Maintainer: Riderius <riderius.help@gmail.com>

pkgname='git-fame'
pkgver='4.0.0'
pkgrel=2
pkgdesc='Pretty-print git repository collaborators sorted by contributions'
arch=('any')
url="https://github.com/casperdcl/$pkgname"
license=('MPL-2.0')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
depends=('python-argopt' 'python-tqdm' 'python-tabulate' 'python-shtab')
optdepends=('python-yaml')
provides=('git-fame')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('9d6b4f0cb642b405f9be9c3a4d47f84503175bd885733731d17edafa84713198')

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
