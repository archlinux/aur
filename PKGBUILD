# Maintainer: Antoni Boucher <bouanto@zoho.com>

pkgname='i3-notifier'
_module='i3-notifier'
_src_folder='i3-notifier-0.18'
pkgver='0.18'
pkgrel=1
pkgdesc="A notification daemon for i3"
url=""
depends=('python' 'python-dbus' 'python-daemon' 'python-pyxdg')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('APACHE2')
arch=('any')
source=("https://files.pythonhosted.org/packages/f1/f0/a3f91442e8b5c65ed975d48e223bf17930d161d245c38244c77d1fad18f9/i3-notifier-0.18.tar.gz")
sha256sums=('4d4044271d687a7d2edbbf7bba65a44559082be5d9bdb3bcc2b51110d99920c9')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
